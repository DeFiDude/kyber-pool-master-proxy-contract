pragma solidity 0.6.6;

import "../KyberPoolMaster.sol";


contract KyberPoolMasterWithSetters is KyberPoolMaster {
    constructor(
        address _kyberDao,
        address _kyberFeeHandler,
        uint256 _epochNotice,
        uint256 _delegationFee,
        address[] memory _kyberFeeHandlers,
        IERC20[] memory _rewardTokens
    )
        public
        payable
        KyberPoolMaster(
            _kyberDao,
            _kyberFeeHandler,
            _epochNotice,
            _delegationFee,
            _kyberFeeHandlers,
            _rewardTokens
        )
    {}

    function setClaimedPoolReward(uint256 epoch) public {
        claimedPoolReward[epoch] = true;
    }

    function setClaimedEpochFeeHandlerPoolReward(uint256 _epoch, address _feeHandler) public {
        claimedEpochFeeHandlerPoolReward[_epoch][_feeHandler] = true;
    }

    function setClaimedDelegateReward(uint256 epoch, address member) public {
        claimedDelegateReward[epoch][member] = true;
    }

    function setClaimedEpochFeeHandlerDelegateReward(uint256 epoch, address member, address feeHandler) public {
        claimedEpochFeeHandlerDelegateReward[epoch][member][feeHandler] = true;
    }

    function setMemberRewards(uint256 epoch, uint256 totalRewards, uint256 totalStaked) public {
        memberRewards[epoch] = Reward(totalRewards, totalStaked);
    }

    function setMemberRewardsByFeeHandler(uint256 epoch, address feeHandler, uint256 totalRewards, uint256 totalStaked) public {
        memberRewardsByFeeHandler[epoch][feeHandler] = Reward(totalRewards, totalStaked);
    }
}
