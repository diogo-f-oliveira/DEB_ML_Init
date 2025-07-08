function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_magna

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_magna'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH', 'TPa'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Wd0'; 'Wdb'; 'Wd_L'}; 
metaData.data_1     = {'t-L_f'; 't-Wd_f'; 't-M_PLC'; 't-N_f'; 'L-JX';'L-Fm'; 'L-JO'; 't-S'; 'X-Jx'; 'T-ab'; 'T-ap'; 'L-Wd'}; 

metaData.COMPLETE = 6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2009 04 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2012 01 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 01 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Andre Gergs'};    
metaData.date_mod_3     = [2019 03 16];              
metaData.email_mod_3    = {'andre.gergs@bayer.com'};            
metaData.address_mod_3  = {'Bayer AG'}; 

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 03 29];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 29];

%% set data
% zero-variate data

data.ab = 1;     units.ab = 'd';     label.ab = 'age at birth';             bibkey.ab = 'MacABail1929';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 45;    units.am = 'd';     label.am = 'life span';                bibkey.am = 'MacABail1929';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.1; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'PreuHamm2009';
comment.Lb = 'length at birth depends on size of the mother respective its brood number, usually neonates of first brood are smaller (~0.08cm), compared to later broods';
data.Lp  = 0.25; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Kooy2010';

data.Wd0 = 8.2;  units.Wd0 = 'mug';  label.Wd0 = 'initial dry weight';      bibkey.Wd0 = 'Elen1989';
data.Wdb = 6.6;  units.Wdb = 'mug';  label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'Elen1989';
data.Wd37 = 600; units.Wd37 = 'mug'; label.Wd37 = 'dry weight at L = 3.7 mm'; bibkey.Wd37 = 'Elen1989';
  comment.Wd37 = 'after brood release';
 
% uni-variate data

% length-ingestion rate
% YangHua2000: per g dry weight of Chlorella: 
%    0.57 g Prot, 0.2 g Carbo, 0.15 g Lipid, 0.02 g Chlo
%    p_X = mu_X d_X V_X/ w_X times cells/d
data.LpX = [ ... % length (mm), ingestion rate (10^5 cells/h Chlorella pyrenoidosa)
          0.658178850 0.6923650756
	      1.021592306 0.5450395978
	      1.151867194 0.6381083757
	      1.217525399 0.7237877094
	      1.228410757 0.5984383666
	      1.270883144 0.6098935363
	      1.235619235 0.4829011988
	      1.258633088 0.443595905
	      1.314729962 0.3101088229
	      1.193817756 0.3050603631
	      1.364232095 0.6973416286
	      1.239615488 1.293247774
	      1.487600926 1.105602828
	      1.571622774 1.128519455
	      1.619855087 1.286742229
	      1.587866956 1.494447187
	      1.738562686 1.054957327
	      1.64213957  0.7659154419
	      1.68723249  0.6794815248
	      2.328616974 1.861310899
	      1.711530604 3.315966971
	      2.341576483 1.886669122
	      2.336198194 2.601165762
	      2.309408783 3.194447954
	      2.318373328 3.628935147
	      2.485575827 2.51010647;
	      2.646649076 2.219310178
	      2.62951671  2.485636658
	      2.595976254 2.887137232
	      2.595527715 3.200328232
	      2.721416271 3.444148593
	      2.655139688 4.168847275
	      2.757354506 5.234947285
	      2.948642866 3.565918177
	      3.327774423 2.218584299
	      4.078359382 2.375936565
	      3.488441932 3.487858214
	      3.31230834  3.584972077
	      3.246047419 3.710698711
	      3.370573404 4.273588573
	      3.425109058 4.328024894
	      3.341238421 4.404935893
	      3.178010131 5.10093377
	      3.343210927 5.097850778
	      3.169192993 5.37307587
	      3.363885914 5.342387994
	      3.365105332 5.53812215
	      3.248911528 5.601551405
	      3.690156995 5.046551306
	      3.943140827 6.330855637
	      3.980795295 7.426756886
	      4.115672953 7.511964606
	      4.069264902 7.948786495
	      4.031739215 8.156529182
	      3.564614112 8.077500022
	      3.920227397 8.873706368
	      3.901860789 8.93451167
	      4.114130813 8.931107981];
data.LpX(:,1) = data.LpX(:,1)/ 10; % convert to cm
V_X = 20;% volume has shown to be lower compared to the value used in the previous version (Umorin M.,Lind O.: Biotechnology Letters (2005) 27: 347-354):    38.4;  mum^3, volume of 1 chlorella cell (Phylopars) ;
d_X =  0.51;% g/cm^3, measured density (Hu. W. 2014. Master Thesis, University of Missouri-Columbia)   ; value used in the previous version was.5*0.37012; % g/cm^3, specific density of Chlorella (excluding cellulose wall)
mu_X = 0.5e6; % J/mol, chemical potential of Chlorella
w_X = 12 + 1.87 + 16*0.5 + 14*0.18; % g/mol, molecular weight of dry chlorella
data.LpX(:,2) = data.LpX(:,2) * 24e-7 * V_X * mu_X * d_X/ w_X; % J/d
units.LpX  = {'cm', 'J/d'};  label.LpX = {'length', 'ingestion rate'};  
temp.LpX   = C2K(20);  units.temp.LpX = 'K'; label.temp.LpX = 'temperature';
bibkey.LpX = 'EverKooy1989';
comment.LpX = 'YangHua2000: per g dry weight of Chlorella: 0.57 g Prot, 0.2 g Carbo, 0.15 g Lipid, 0.02 g Chlo; p_X = mu_X d_X V_X/ w_X times cells/d';

% length-respiration rate
data.LJO = [ ... % length (mm), O2 consumption (mug/h)
        1.260883139 0.2233842425
		1.405191073 0.2056391232
		1.634466719 0.453598137
		2.001428365 0.4701286594
		2.077313292 0.6339746064
		2.468239107 1.078976795
		2.600939524 0.5231470942
		2.72967346  1.311428603
		2.945740597 1.435386799
		3.063765331 2.317780428
		3.170982013 2.446190194
		3.456354211 2.881249986
		3.558629058 3.060590838
		3.70707962  3.210028264
		3.711213216 3.299708566
		3.970151101 3.338405283
		4.057614766 3.793435807];
data.LJO(:,1) = data.LJO(:,1)/ 10; % convert to cm
units.LJO  = {'cm', 'mug/h'};  label.LJO = {'length', 'O2 consumption'};  
temp.LJO   = C2K(20);  units.temp.LJO = 'K'; label.temp.LJO = 'temperature';
bibkey.LJO = 'EverKooy1989';
%
data.LJO_extra = [... % length (mm), O2 consumption (mug/h)
 		2.824651954 2.565837854
		3.484454814 3.423759803
        3.652060369 5.190775791
        3.911796171 5.000287129
        3.915882794 4.686955762];
data.LJO_extra(:,1) = data.LJO_extra(:,1)/ 10; % convert to cm
units.LJO_extra  = {'cm', 'mug/h'};  label.LJO_extra = {'length', 'O2 consumption'};  
temp.LJO_extra   = C2K(20);  units.temp.LJO_extra = 'K'; label.temp.LJO_extra = 'temperature';
bibkey.LJO_extra = 'EverKooy1989';

% time-fecundity
data.tN = [ ... % time since birth (f), cum # of eggs
 	    1    0.00000
	    2    0.00000
	    3    0.00000
 	    4    0.00000
	    5    0.00000
	    6   13.63704
 	    7   15.09108
 	    8   25.18230
 	    9   33.72712
 	   10   37.09086
	   11   65.45481
	   12   65.45481
 	   13   76.09054
	   14   98.81777
	   15   98.81777
	   16  126.27218
	   17  129.72740
	   18  137.45415
	   19  164.81796
	   20  168.45439
       21  198.27239];
units.tN  = {'d', '#'};  label.tN = {'time since birth', 'cumulative # of eggs'};  
temp.tN   = C2K(20);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'KooyBeda1996';
 
% time-length
data.tL_f = [ ... % time since birth (mm), length (mm) of female
    0.544771453 0.7244883261
	5.561212068 1.715405949
	7.556335739 2.007877857
	13.57290008 3.114594208
	27.3461404  3.851026544
	34.07530396 4.290242314
	59.74547109 4.658982601
	86.47530692 5.035983617
   103.3745603  5.226993726];
data.tL_f(:,2) = data.tL_f(:,2)/ 10; % convert to cm
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MacABail1929';
comment.tL_f = 'Female data';
%
data.tL_m = [ ... % time since birth (mm), length (mm) of male
        0.35769396  0.7818913724
        7.702727101 1.934972266
       13.19067059  2.109816734
       27.74414296  2.5842522
       60.02645776  2.693297154];
data.tL_m(:,2) = data.tL_m(:,2)/ 10; % convert to cm
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MacABail1929';
comment.tL_m = 'Male data';
%
% time-length at various food levels
data.tL1 = [ ... % time since birth (d), length (mm)
        0.5  1.07968304
        2.5  1.908115044
        4.5  2.475
        7.5  3.424402865
        9.5  3.650166031
       11.5  4.000100271
       14.5  4.024254479
       16.5  4.200629029];
data.tL1(:,2) = data.tL1(:,2)/ 10; % convert to cm
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'length'};  
temp.tL1   = C2K(20);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'EverKooy1989';
%
data.tL2 = [ ... % time since birth (d), length (mm)
        0.5 1.052536891
        2.5 1.882650553
        4.5 2.469904757
        7.5 3.369121527
        9.5 3.493238667
       11.5 3.848076589
       14.5 3.903729304
       16.5 3.600193173];
data.tL2(:,2) = data.tL2(:,2)/ 10; % convert to cm
units.tL2  = {'d', 'cm'};  label.tL2 = {'time since birth', 'length'};  
temp.tL2   = C2K(20);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'EverKooy1989';
%
data.tL3 = [ ... % time since birth (d), length (mm)
        0.5 1.055829561
        2.5 1.804010257
        4.5 2.387406624
        7.5 2.913488199
        9.5 3.204071326
       11.5 3.427446376
       14.5 3.476782491
       16.5 3.478551507];
data.tL3(:,2) = data.tL3(:,2)/ 10; % convert to cm
units.tL3  = {'d', 'cm'};  label.tL3 = {'time since birth', 'length'};  
temp.tL3   = C2K(20);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'EverKooy1989';
%
data.tL4 = [ ... % time since birth (d), length (mm)
        0.5 1.031976083
        2.5 1.745083019
        4.5 2.271092514
        7.5 2.559077022
        9.5 2.816197402
       11.5 2.939749376
       14.5 2.97469999
       16.5 3.021434617];
data.tL4(:,2) = data.tL4(:,2)/ 10; % convert to cm
units.tL4  = {'d', 'cm'};  label.tL4 = {'time since birth', 'length'};  
temp.tL4   = C2K(20);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'EverKooy1989';
%
data.tL5 = [ ... % time since birth (d), length (mm)
        0.5 1.028118246
        2.5 1.762831836
        4.5 1.966564473
        7.5 2.348761915
        9.5 2.486275515
       11.5 2.605051257
       14.5 2.670030657
       16.5 2.696981579];
data.tL5(:,2) = data.tL5(:,2)/ 10; % convert to cm
units.tL5  = {'d', 'cm'};  label.tL5 = {'time since birth', 'length'};  
temp.tL5   = C2K(20);  units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
bibkey.tL5 = 'EverKooy1989';

% Starvation data from Elen89; t = 0 is just after brood 3, L = .37 mm
% consistency check: composition brood = mother. Brood 3 in mug:
% dry 236; prot 167; carbo 13; glyc 4.6; lipid  41; trig 28
% frac for brood .71       .06       .02        .17      .12
% for mother     .56       .10       .07        .12      .06
% conclusion: error is of order factor 2

% time-dry weight
data.tWd = [ ...     %  time (d), dryweight (mug)
   0	874.19559193 % before brood 3
   0.05	638.38344958 % after brood 3
   1	590.08916002
   2	595.56352065
   3	304.67997675
   4    249.54438256
   5    217.95801061
   6	213.33083542];
units.tWd   = {'d', 'mug'};  label.tWd = {'starvation time', 'dry weight'};  
temp.tWd    = C2K(20);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'Elen1989';
comment.tWd = 'Dry weight; starvation at L = 0.347 mm; t = 0 is just after brood 3';

% time-protein
data.tProt = [ ...    % time (d), protein (mug)
   0	487.31803525 % before brood 3
   0.1	320.38318254 % after brood 3
   1	313.79644993
   2	305.83852487
   3	 92.68384310
   4	 67.75193313
   5	 55.54894656
   6	 56.06862223];
units.tProt   = {'d', 'mug'};  label.tProt = {'starvation time', 'protein'};  
temp.tProt    = C2K(20);  units.temp.tProt = 'K'; label.temp.tProt = 'temperature';
bibkey.tProt = 'Elen1989';
comment.tProt = 'Protein; starvation at L = 0.347 mm; t = 0 is just after brood 3';

% time-carbon
data.tCarb = [ ... % time (d), carbohydrate (mug)
   0   88.48602663 % before brood 3
   0.1 75.57954250 % after brood 3
   1   47.25417433
   2   41.72127369
   3   16.49209268
   4   11.77282116
   5   10.12970215
   6    8.28373239];
units.tCarb   = {'d', 'mug'};  label.tCarb = {'starvation time', 'weight'};  
temp.tCarb    = C2K(20);  units.temp.tCarb = 'K'; label.temp.tCarb = 'temperature';
bibkey.tCarb = 'Elen1989';
comment.tCarb = 'Carbohydrate; starvation at L = 0.347 mm; t = 0 is just after brood 3';

% time-glycogen
data.tGlyc = [ ...  % time (d), glycogen (mug)
   0   63.23955214 % before brood 3
   0.1 58.60220097 % after brood 3
   1   19.86716476
   2   14.91170744
   3    4.12276853
   4    1.78232375
   5    1.25406983
   6    1.33107162];
units.tGlyc   = {'d', 'mug'};  label.tGlyc = {'starvation time', 'weight'};  
temp.tGlyc    = C2K(20);  units.temp.tGlyc = 'K'; label.temp.tGlyc= 'temperature';
bibkey.tGlyc = 'Elen1989';
comment.tGlyc = 'Glycogen; starvation at L = 0.347 mm; t = 0 is just after brood 3';

% time-lipid
data.tLipi = [ ...  % time (d), lipid (mug)
   0   105.97577778 % before brood 3
   0.1  64.80709253 % after brood 3
   1	54.08667386
   2	58.22952797
   3	19.32080160
   4	13.27809195
   5	11.86766198
   6	11.84555302];
units.tLipi   = {'d', 'mug'};  label.tLipi = {'starvation time', 'weight'};  
temp.tLipi    = C2K(20);  units.temp.tLipi = 'K'; label.temp.tLipi = 'temperature';
bibkey.tLipi = 'Elen1989';
comment.tLipi = 'Lipid; starvation at L = 0.347 mm; t = 0 is just after brood 3';

% time-triglyceride
data.tTrig = [ ...   %  time (d), triglyceride (mug)
   0	56.26742784 % before brood 3
   0.1  27.91600935 % after brood 3
   1	18.54586656
   2	23.09356343
   3	 2.46114961
   4	 1.91551546
   5	 1.21735594
   6	 1.42906117];   
units.tTrig   = {'d', 'mug'};  label.tTrig = {'starvation time', 'weight'};  
temp.tTrig    = C2K(20);  units.temp.tTrig = 'K'; label.temp.tTrig = 'temperature';
bibkey.tTrig = 'Elen1989';
comment.tTrig = 'Triglyceride; starvation at L = 0.347 mm; t = 0 is just after brood 3';

% time-survival
data.tS_f =	[ ... % time since birth (d), surviving fraction for females
     1  1
	 8  0.911
	 15 0.889
	 22 0.795
	 29 0.665
	 36 0.584
	 43 0.431
	 50 0.346
	 57 0.258
	 64 0.146
	 71 0.115
	 78 0.070
	 85 0.035
	 92 0.001
	 99 0.000];
units.tS_f  = {'d', '-'};  label.tS_f = {'time since birth', 'surviving fraction'};  
temp.tS_f   = C2K(18);  units.temp.tS_f = 'K'; label.temp.tS_f = 'temperature';
bibkey.tS_f = 'MacABail1929';
comment.tS_f = 'Female data';
%
data.tS_m =	[ ... % time since birth (d), surviving fraction for males
     1 1
	 8 0.991
	15 0.949
	22 0.870
	29 0.677
	36 0.414
	43 0.263
	50 0.076
	57 0.061
	64 0.044
	71 0.018
	78 0.007
	85 0.003
	92 0.000];
units.tS_m = {'d', '-'};  label.tS_m = {'time since birth', 'surviving fraction'};  
temp.tS_m   = C2K(18);  units.temp.tS_m = 'K'; label.temp.tS_m = 'temperature';
bibkey.tS_m = 'MacABail1929';
comment.tS_m = 'Male data';

% time-length
data.tL_SK1 = [ ... % time since birth (d), length (mm)
    3	1.98
    7	2.53
    13	4.46
    14	4.46
    19	4.57
    21	4.47];
data.tL_SK1(:,2) = data.tL_SK1(:,2)/ 10; % convert to cm
units.tL_SK1  = {'d', 'cm'};  label.tL_SK1 = {'time since birth', 'length'};  
temp.tL_SK1   = C2K(20);  units.temp.tL_SK1 = 'K'; label.temp.tL_SK1 = 'temperature';
bibkey.tL_SK1 = 'PreuHamm2009';
comment.tL_SK1 = 'flow-through experiment with 0.002 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-fecundity
data.tN_SK1 = [ ... % time since birth (d), cumulative # of eggs
    7	0.6
    8	6.8
    9	10.5
    10	19.3
    11	32.2
    12	37.5
    13	56
    14	72.9
    15	72.9
    16	101.5
    17	112.1
    18	122.7
    19	137.6];
units.tN_SK1  = {'d', 'cm'};  label.tN_SK1 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_SK1   = C2K(20);  units.temp.tN_SK1 = 'K'; label.temp.tN_SK1 = 'temperature';
bibkey.tN_SK1 = 'PreuHamm2009';
comment.tN_SK1 = 'flow-through experiment with 0.002 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-length
data.tL_SK2 = [ ... % time since birth (d), length (mm)
    1	1.17
    2	1.3
    3	1.7
    4	2.26
    5	2.29
    6	3.01
    7	3.01
    8	2.99
    9	3.65
    10	3.61
    12	4.11
    14	4.11
    16	4.38
    18	4.55
    20	4.57
    22	4.62
    24	4.65
    26	4.66
    28	4.68
    30	4.86
    32	4.91
    34	4.92
    36	4.97
    38	5.05
    40	5.066
    42	5.16];
data.tL_SK2(:,2) = data.tL_SK2(:,2)/ 10; % convert to cm
units.tL_SK2  = {'d', 'cm'};  label.tL_SK2 = {'time since birth', 'length'};  
temp.tL_SK2   = C2K(20);  units.temp.tL_SK2 = 'K'; label.temp.tL_SK2 = 'temperature';
bibkey.tL_SK2 = 'PreuHamm2009';
comment.tL_SK2 = 'flow-through experiment with 0.0005 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-fecundity
data.tN_SK2 = [ ... % time since birth (d), cumulative # of eggs
    7	0
    8	7.6
    9	11.3
    10	11.3
    11	27.9
    12	34.8
    13	35
    14	46.8
    15	64.4
    16	64.4
    17	81.9
    18	91.8
    21	117.2];
units.tN_SK2  = {'d', 'cm'};  label.tN_SK2 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_SK2   = C2K(20);  units.temp.tN_SK2 = 'K'; label.temp.tN_SK2 = 'temperature';
bibkey.tN_SK2 = 'PreuHamm2009';
comment.tN_SK2 = 'flow-through experiment with 0.0005 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-length
data.tL_SK3 = [ ... % time since birth (d), length (mm)
    0	1.05
    1	1.08
    2	1.28
    3	1.43
    4	1.67
    5	2.04
    6	2.07
    7	2.33
    8	2.73
    9	2.49
    10	2.79
    11	2.8
    12	2.84
    13	2.94
    14	2.97
    15	3.05
    16	3.05
    17	3.02
    18	3.16
    19	3.22
    20	3.18
    21	3.41
    22	3.23
    23	3.26
    24	3.26
    25	3.35
    26	3.35
    27	3.35
    28	3.35
    29	3.39
    30	3.39
    31	3.39
    32	3.39
    33	3.38
    34	3.38
    35	3.41
    36	3.41
    37	3.41
    38	3.41
    39	3.47
    40	3.41
    41	3.49
    42	3.49];
data.tL_SK3(:,2) = data.tL_SK3(:,2)/ 10; % convert to cm
units.tL_SK3  = {'d', 'cm'};  label.tL_SK3 = {'time since birth', 'length'};  
temp.tL_SK3   = C2K(20);  units.temp.tL_SK3 = 'K'; label.temp.tL_SK3 = 'temperature';
bibkey.tL_SK3 = 'PreuHamm2009';
comment.tL_SK3 = 'flow-through experiment with 0.0001 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-fecundity
data.tN_SK3 = [ ... % time since birth (d), cumulative # of eggs
    7	0
    8	1.4
    9	5.2
    10	4.3
    11	4.7
    12	7.2
    13	8.8
    14	9.7
    15	11.8
    16	11.8
    17	15.7
    18	16
    19	19.6
    20	19.7
    21	24.5];
units.tN_SK3  = {'d', 'cm'};  label.tN_SK3 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_SK3   = C2K(20);  units.temp.tN_SK3 = 'K'; label.temp.tN_SK3 = 'temperature';
bibkey.tN_SK3 = 'PreuHamm2009';
comment.tN_SK3 = 'flow-through experiment with 0.0001 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-length
data.tL_SK4 = [ ... % time since birth (d), length (mm)
    0	1
    1	1.15
    2	1.21
    3	1.36
    4	1.43
    5	1.59
    6	1.66
    7	1.6
    8	1.87
    10	2.11
    12	2.21
    14	2.26
    16	2.39
    17	2.52
    18	2.43
    20	2.53
    21	2.53
    22	2.57
    24	2.61
    26	2.65
    28	2.66
    30	2.74
    32	2.76
    34	2.79
    36	2.87
    38	2.89
    40	2.95
    42	2.97];
data.tL_SK4(:,2) = data.tL_SK4(:,2)/ 10; % convert to cm
units.tL_SK4  = {'d', 'cm'};  label.tL_SK4 = {'time since birth', 'length'};  
temp.tL_SK4   = C2K(20);  units.temp.tL_SK4 = 'K'; label.temp.tL_SK4 = 'temperature';
bibkey.tL_SK4 = 'PreuHamm2009';
comment.tL_SK4 = 'flow-through experiment with 0.00002 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-fecundity
data.tN_SK4 = [ ... % time since birth (d), cumulative # of eggs
    11	0
    12	0.33
    13	0.58
    14	0.58
    15	1.04
    16	1.04
    17	2.58
    %21	1.4 %unclear data point
    42  5.7];
units.tN_SK4  = {'d', 'cm'};  label.tN_SK4 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_SK4   = C2K(20);  units.temp.tN_SK4 = 'K'; label.temp.tN_SK4 = 'temperature';
bibkey.tN_SK4 = 'PreuHamm2009';
comment.tN_SK4 = 'flow-through experiment with 0.00002 mgC/ml food; data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% food density-ingestion rate
data.xf = [ ... % algae density (mgC/ml), ingestion rate (mgC/h)
    2.37651E-05	6.38712E-05
    0.0000975	0.000260225
    0.000195	0.000579214
    0.0004875	0.001012473
    0.000975	0.000900624
    0.00195	    0.001137359];
data.xf(:,2) = data.xf(:,2)*24; % convert to d
units.xf  = {'mgC/ml', 'mgC/d'};  label.xf = {'algae density', 'ingestion rate'};  
temp.xf   = C2K(20);  units.temp.xf = 'K'; label.temp.xf = 'temperature';
bibkey.xf = 'GergPreu2014';
comment.xf = 'ingestion rate by 2mm daphnids, data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% time-length
data.tL_C1 = [ ... % time since birth (d), length (mm)
    7       3.13
    8       3.56
    9       3.57
    10      3.55
    10.01	3.64 %0.01 added here and below to integrate data from two experiments 
    11      3.89
    12      3.9
    13      3.9
    13.01	3.88
    14      4.17
    15      4.16
    16      4.16
    16.01	4.13
    17      4.39
    18      4.41
    19      4.42
    19.01	4.28
    20      4.61
    22      4.41];
data.tL_C1(:,2) = data.tL_C1(:,2)/ 10; % convert to cm
units.tL_C1  = {'d', 'cm'};  label.tL_C1 = {'time since birth', 'length'};  
temp.tL_C1   = C2K(20);  units.temp.tL_C1 = 'K'; label.temp.tL_C1 = 'temperature';
bibkey.tL_C1 = 'CoorHammRatt2004';
comment.tL_C1 = 'static experiment with 0.2 mgC/d food, data from figures in PreuHamm2009';

% time-fecundity
data.tN_C1 = [ ... % time since birth (d), cumulative # of eggs
    7	0
    8	12.3
    9	12.3
    10	18.4
    11	33.7
    12	33.7
    13	45.8
    14	60.8
    15	60.8
    16	68.6
    17	90
    18	90
    19	93.8
    20	120.2
    10	10.4
    11	10.4
    12	10.4
    13	32.6
    14	32.6
    15	35.4
    16	56
    17	56
    18	56
    19	81.4
    20	81.4
    21	81.4
    22	109.3];
units.tN_C1  = {'d', 'cm'};  label.tN_C1 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_C1   = C2K(20);  units.temp.tN_C1 = 'K'; label.temp.tN_C1 = 'temperature';
bibkey.tN_C1 = 'CoorHammRatt2004';
comment.tN_C1 = 'static experiment with 0.2 mgC/d food, data from figures in PreuHamm2009';

% time-length
data.tL_C2 = [ ... % time since birth (d), length (mm)
    7	3.13
    8	3.56
    9	3.54
    10	3.52
    11	3.76
    12	3.74
    13	3.77
    14	3.89
    15	3.91
    16	3.92
    17	3.96
    18	4.03
    19	4.04
    20	4.02
    21	4.17];
data.tL_C2(:,2) = data.tL_C2(:,2)/ 10; % convert to cm
units.tL_C2  = {'d', 'cm'};  label.tL_C2 = {'time since birth', 'length'};  
temp.tL_C2   = C2K(20);  units.temp.tL_C2 = 'K'; label.temp.tL_C2 = 'temperature';
bibkey.tL_C2 = 'CoorHammRatt2004';
comment.tL_C2 = 'static experiment with 0.075 mgC/d food, data from figures in PreuHamm2009';

% time-fecundity
data.tN_C2 = [ ... % time since birth (d), cumulative # of eggs
    7	0
    8	14.1
    9	14.1
    10	16.6
    11	34.7
    12	34.7
    13	34.7
    14	51.4
    15	51.4
    16	51.4
    17	65.9
    18	65.9
    19	65.9
    20	68.6
    21	78.7];
units.tN_C2  = {'d', 'cm'};  label.tN_C2 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_C2   = C2K(20);  units.temp.tN_C2 = 'K'; label.temp.tN_C2 = 'temperature';
bibkey.tN_C2 = 'CoorHammRatt2004';
comment.tN_C2 = 'static experiment with 0.075 mgC/d food, data from figures in PreuHamm2009';

% time-length
data.tL_C3 = [ ... % time since birth (d), length (mm)
    0       1.1
    0.01	1.03 %0.01 added here and below to integrate data from two experiments
    1       1.48
    2       1.95
    3       2.3
    4       2.48
    5       3.1
    6       3.08
    7       3.09
    7.01	3.21
    8       3.4
    9       3.41
    10      3.41
    10.01	3.48
    11      3.52
    12      3.54
    13      3.56
    14      3.65
    14.01	3.56
    15      3.65
    16      3.66
    17      3.68
    17.01	3.69
    18      3.74
    19      3.76
    20      3.76
    20.01	3.75
    21      3.87
    23.01	3.81];
data.tL_C3(:,2) = data.tL_C3(:,2)/ 10; % convert to cm
units.tL_C3  = {'d', 'cm'};  label.tL_C3 = {'time since birth', 'length'};  
temp.tL_C3   = C2K(20);  units.temp.tL_C3 = 'K'; label.temp.tL_C3 = 'temperature';
bibkey.tL_C3 = 'CoorHammRatt2004';
comment.tL_C3 = 'static experiment with 0.075 mgC/d food, data from figures in PreuHamm2009';

% time-fecundity
data.tN_C3 = [ ... % time since birth (d), cumulative # of eggs
    7	0
    8	14
    9	14
    10	14
    11	28.7
    12	28.7
    13	28.7
    14	36.6
    15	38.7
    16	38.7
    17	44.6
    18	48.8
    19	48.8
    20	49
    21	57.8
    10	11
    11	11
    12	11
    13	27.6
    14	27.6
    15	27.6
    16	30.8
    17	38.2
    18	38.2
    19	39.1
    20	47.2
    21	47.2
    22	47.2
    23	57.3];
units.tN_C3  = {'d', 'cm'};  label.tN_C3 = {'time since birth', 'cumulative # of eggs'};  
temp.tN_C3   = C2K(20);  units.temp.tN_C3 = 'K'; label.temp.tN_C3 = 'temperature';
bibkey.tN_C3 = 'CoorHammRatt2004';
comment.tN_C3 = 'static experiment with 0.05 mgC/d food, data from figures in PreuHamm2009';

% length-filtration rate
data.LFx = [ ... % length (mm),	filtration rate (mL/h)
    2.195	4.915
    3.722	8.92
    1.734	1.206
    1.159	1.299
    0.96	0.57	
    2.749	8.893
    2.72	3.611
    2.053	3.46	
    2.3975	4.35
    1.03	1.12
    3.46	11.91	
    1.44	1.35
    3.39	7.76
    2.66	5.93
    1.03	0.43
    1.5	    1.77
    1.88	1.14
    2.56	5.08
    2.85	6.46
    3.2	    7.26
    3.23	13.33
    3.43	9.25
    3.57	10.29
    3.88	13.89
    1.28	1.26
    1.98	1.81
    2.5	    4.09
    2.94	9.36
    3.54	13.07];
data.LFx(:,1) = data.LFx(:,1)/ 10; % convert to cm   
data.LFx(:,2) = data.LFx(:,2)/ 1000*24; % convert to L/d
units.LFx  = {'cm', 'L/d'};  label.LFx = {'length', 'filtration rate'};  
temp.LFx   = C2K(20);  units.temp.LFx = 'K'; label.temp.LFx = 'temperature';
bibkey.LFx = 'PreuHamm2009';
comment.LFx = 'data originally from Sokull-Kluettgen B (1998) "Die kombinierte Wirkung von Nahrungsangebot und 3,4-Dichloranilin auf die Lebensdaten von zwei nahverwandten Cladocerenarten, Daphnia magna und Ceriodaphnia quadrangula." Shaker, Aachen: 110p.';

% length-dry weight
data.LDw = [ ... % length, mm	dry weight, mg
    1.1	    0.0189
    1.1	    0.019066667
    1.12	0.019233333
    1.13	0.022733333
    1.15	0.019533333
    1.15	0.024866667
    1.17	0.0187
    1.25	0.017
    1.27	0.025066667
    1.28	0.0227
    1.31	0.0208
    1.34	0.05
    1.34	0.079
    1.34	0.0131
    1.38	0.0214
    1.46	0.0111
    1.52	0.0176
    1.52	0.0155
    1.55	0.0158
    1.6	    0.052
    1.61	0.0322
    1.64	0.0393
    1.64	0.0343
    1.67	0.0463
    1.98	0.075
    2	    0.253
    2.23	0.087
    2.28	0.138];
data.LDw(:,1) = data.LDw(:,1)/ 10; % convert to cm   
data.LDw(:,2) = data.LDw(:,2)/ 1000; % convert to g
units.LDw  = {'cm', 'g'};  label.LDw = {'length', 'dry weight'};  
temp.LDw   = C2K(20);  units.temp.LDw = 'K'; label.temp.LDw = 'temperature';
bibkey.LDw = 'GergPreu2014';
comment.LDw = 'data for juveniles, data set is split up as original data includes adults that carry broods';
%
data.LDwA = [ ... % length, mm	dry weight, mg
    2.52	0.087
    2.53	0.096
    2.65	0.177
    2.9	    0.159
    3.24	0.132
    3.25	0.253
    3.28	0.13
    3.35	0.359
    3.41	0.147
    3.5	    0.307
    3.5	    0.375
    3.5	    0.384
    3.6	    0.295
    3.6	    0.391
    3.65	0.315
    3.65	0.338
    3.66	0.246
    3.7	    0.316
    3.75	0.257
    3.75	0.271
    3.8	    0.415
    3.81	0.302
    3.81	0.302
    3.85	0.388
    3.87	0.324
    3.87	0.324
    3.95	0.353
    3.99	0.363
    4	    0.333
    4	    0.34
    4	    0.351
    4.1	    0.448
    4.15	0.428
    4.15	0.435
    4.17	0.416
    4.17	0.416
    4.24	0.488
    4.25	0.432
    4.26	0.616
    4.3	    0.43
    4.38	0.493
    4.41	0.227];
units.LDwA  = {'cm', 'g'};  label.LDwA = {'length', 'dry weight'};  
temp.LDwA   = C2K(20);  units.temp.LDwA = 'K'; label.temp.LDwA = 'temperature';
bibkey.LDwA = 'GergPreu2014';
comment.LDwA = 'data for adults, data set is split up as original data includes adults that carry broods';

% time-survival
data.tS = [ ...      %  time (d), survival (-)
    0	1
    1	1
    2	1
    3	1
    4	1
    5	1
    6	0.3
    7	0.3
    8	0.3
    9	0.3
    10	0.1
    11	0.1
    12	0.1
    13	0];
units.tS   = {'d', '-'};  label.tS = {'starvation time', 'survival'};  
temp.tS    = C2K(20);  units.temp.tS = 'K'; label.temp.tS = 'temperature';
bibkey.tS = 'PreuHamm2009';
comment.tS = 'starvation initiated ~1 day afer birth';

% temperature-time since birth at puberty
data.Tap = [ ...      %  Temperature (C), time till puberty (d) 
    10 15.6
    15 9.2
    20 7
    10 17.1
    15 8.8
    20 5.5
    25 4.4
    10 16.7
    15 9.4
    20 7.3
    25 5];
units.Tap   = {'C', 'd'};  label.Tap = {'temperature', 'time since birth at puberty'};  
bibkey.Tap = 'Duel1988';

% temperature-time between broods
data.Tab = [ ...      %  Temperature (C), time between broods (d)         
    17	3.9
    17	3.9
    20	3
    20	3
    20	2.3
    23	2.7
    23	3.2
    23	2.1
    17	4.1
    17	2.1
    20	3.1
    20	2.8
    20	2.2
    23	2.8
    23	2.3
    23	2.4];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'time between broods'};  
bibkey.Tab = 'StepWatt1984';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tN(data.tN(:,2) == 0) = 0;
weights.tS_f(data.tS_f(:,2) < .05) = 0;
weights.tS_m(data.tS_m(:,2) < .05) = 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 5 * weights.psd.k_J;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'MacABail1929 data for female, male'};
set2 = {'tS_f','tS_m'}; subtitle2 = {'MacABail1929 data for female, male'};
set3 = {'tL1','tL2','tL3','tL4','tL5'}; subtitle3 = {'EverKooy1989 data at different food densities'};
set4 = {'tGlyc','tLipi','tTrig','tCarb',}; subtitle4 = {'Data for Glycogen, Lipids, Triglyceride, Carbohyd.'};
set5 = {'LJO_extra','LJO'}; subtitle5 = {'Respiration data from EverKooy1989'};
set6 = {'tL_SK1','tL_SK2','tL_SK3','tL_SK4'}; subtitle6 = {'Growth data from Sokull-Kluettgen (1998)'};
set7 = {'tN_SK1','tN_SK2','tN_SK3','tN_SK4'}; subtitle7 = {'Reproduction data from Sokull-Kluettgen (1998)'};
set8 = {'tL_C1','tL_C2','tL_C3'}; subtitle8 = {'Growth data from Coors et al. (2004)'};
set9 = {'tN_C1','tN_C2','tN_C3'}; subtitle9 = {'Reproduction data from Coors et al. (2004)'};

metaData.grp.sets = {set1,set2,set3,set4,set5,set6,set7,set8,set9};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4,subtitle5,subtitle6,subtitle7,subtitle8,subtitle9};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and s_G only';
D2 = 'The survival data tS_f for females are assumed to have a background hazard rate of ';
D3 = 'mod_3: Female daphnids are assumed to change kappa in response to conditions of low food availability, for a detailed discussion see GergPreu2014';
D4 = 'mod_3: Daphnids are assumed to increase their filtration rate at prolonged conditons of low food availablity (see Lampert W. Limnol. Oceanogr., 39(5), 1994,997-1006)';
D5 = 'mod_3:Laboratory expariments with daphnids are frequently done using a constant amount of food added e.g. on a daily absis, while the ingestion rate increases as the daphnid grows. This experiemtnal design might result in limited food condition later in the experiments and is not accounted for by the assumption of a constant value for the scaled functional response.';
D6 = 'mod_4: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Facts
F1 = 'This entry is discussed in Kooy2010';
metaData.bibkey.F1 = 'Kooy2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6CCSV'; % Cat of Life
metaData.links.id_ITIS = '83884'; % ITIS
metaData.links.id_EoL = '46498265'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia_magna'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_magna'; % ADW
metaData.links.id_Taxo = '33105'; % Taxonomicon
metaData.links.id_WoRMS = '148372'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Daphnia_magna}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Elen1989'; type = 'Article'; bib = [ ... 
'author = {Elendt, B.-P.}, ' ... 
'year = {1989}, ' ...
'title = {Effects of starvation on growth, reproduction, survival and biochemical composition of \emph{Daphnia magna}}, ' ...
'journal = {Arch. Hydrobiol.}, ' ...
'volume = {4}, ' ...
'pages = {415-433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacABail1929'; type = 'Article'; bib = [ ... 
'author = {MacArthur, J. W. and Baillie, W. H. T.}, ' ... 
'year = {1929}, ' ...
'title = {Metabolic activity and duration of life. I. {I}nfluence of temperature on longevity in \emph{Daphnia magna}}, ' ...
'journal = {J. Exp. Zool.}, ' ...
'volume = {53}, ' ...
'pages = {221-242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EverKooy1989'; type = 'Article'; bib = [ ... 
'author = {Evers, E. and Kooijman, S. A. L. M.}, ' ... 
'year = {1989}, ' ...
'title = {Feeding and oxygen consumption in \emph{Daphnia magna}; a study in energy budgets}, ' ...
'journal = {Neth. J. Zool.}, ' ...
'volume = {39}, ' ...
'pages = {56-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KooyBeda1996'; type = 'Article'; bib = [ ... 
'author = {Kooijman, S. A. L. M. and Bedaux, J. J. M.}, ' ... 
'year = {1996}, ' ...
'title = {Analysis of toxicity tests on \emph{Daphnia} survival and reproduction}, ' ...
'journal = {Water Res.}, ' ...
'volume = {30}, ' ...
'pages = {1711-1723}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'GergPreu2014'; type = 'Article'; bib = [ ... 
'author = {Gergs, A. and Preuss, T. G. and Palmqvist, A.}, ' ... 
'year = {2014}, ' ...
'title = {Double Trouble at High Density: Cross-Level Test of Resource-Related Adaptive Plasticity and Crowding-Related Fitness.}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {9}, ' ...
'pages = {e91503}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'PreuHamm2009'; type = 'Article'; bib = [ ... 
'author = {Preuss, T.G. and Hammers-Wirtz, M. and Hommen, U. and Rubach, M.N. and Ratte, H.T.}, ' ... 
'year = {2009}, ' ...
'title = {Development and validation of an individual based \emph{Daphnia magna} population model: The influence of crowding on population dynamics}, ' ...
'journal = {Ecological Modelling}, ' ...
'volume = {220}, ' ...
'pages = {310-329}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'Duel1988'; type = 'phdthesis'; bib = [ ... 
'author = {Duelmer, U.}, ' ... 
'year = {1988}, ' ...
'title = {Einfluss von Wechseltemperatur und Nahrung auf \emph{Daphnia magna}- ein Beitrag yum Anpassungswert der Vertikalwanderung }, ' ...
'school = {RWTH Aachen University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
bibkey = 'StepWatt1984'; type = 'Article'; bib = [ ... 
'author = {Stephenson, R.R. and Watts, S.A.}, ' ... 
'year = {1984}, ' ...
'title = {Chronic toxicity tests with \emph{Daphnia magna}: the effects of different food and temperature regimes on survival, reproduction and growth. }, ' ...
'journal = {Environ. Pollut. Ser. A}, ' ...
'volume = {36}, ' ...
'pages = {95-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CoorHammRatt2004'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.chemosphere.2004.04.025 }, ' ...
'author = {Coors, A. and Hammers-Wirtz, M. and Ratte, H.T.}, ' ... 
'year = {2004}, ' ...
'title = {Adaptation to environmental stress in \emph{Daphnia magna} simultaneously exposed to a xenobiotic}, ' ...
'journal = {Chemosphere}, ' ...
'volume = {56(4)}, ' ...
'pages = {395-404}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

