function [data, auxData, metaData, txtData, weights] = mydata_Anser_anser

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Anser_anser'; 
metaData.species_en = 'Greylag goose'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc', 'Dwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'xiFm', 'xiFl'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-We'; 't-JOe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 06 24];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.author_mod_4   = {'Carlo Romoli', 'Liubov Zakharova'};
metaData.email_mod_4    = {'carlo.romoli@ibacon.com', 'liubov.zakharova@ibacon.com'}; 
metaData.date_mod_4     = [2024 02 19];
metaData.address_mod_4  = {'ibacon GmbH, Germany'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2024 02 20];

%% set data
% zero-variate data

data.ab = 28;   units.ab = 'd';      label.ab = 'age at birth';                    bibkey.ab = 'Wiki';   
  temp.ab = C2K(34);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for B. canadensis: 24 till 28 d';
data.tx = 60;   units.tx = 'd';      label.tx = 'time since birth at fledging';   bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tp = '78 till 96 d';
data.tp = 180;   units.tp = 'd';      label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';  label.tR = 'time since birth at 1st brood';   bibkey.tR = 'Wiki';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 31 * 365;  units.am = 'd'; label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 87;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Hrou1988';
data.Wwi = 4600; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Hrou1988';
data.Wwim = 5700; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Hrou1988';

data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'Wiki';   
%data.Ri  = 37.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'SunShi2007';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
      1   88
      8  237
     15  570
     22  896
     29 1574
     36 2440
     43 2494
     50 3520
     57 3470
     64 3500
     71 3900
    114 4280];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Hrou1988';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
      1   87
      8  251
     15  661
     22 1130
     29 1686
     36 2470
     43 3056
     50 3620
     57 3780
     64 4420
     71 4580
    114 5280];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Hrou1988';
comment.tW_m = 'Data for males';
% S-line
data.tW_f2 = [ ... % time since birth (d), weight (g)
   0    94
   7    345
   14   894
   21   1359
   28   2048
   35   2592
   42   3137
   49   3694
   56   3977
   63   4079
   92   4862
   154  5205
   192  5590
   217  6113];
units.tW_f2  = {'d', 'g'};  label.tW_f2 = {'time since birth', 'wet weight', 'S-line female'};  
temp.tW_f2    = C2K(41.2);  units.temp.tW_f2 = 'K'; label.temp.tW_f2 = 'temperature';
bibkey.tW_f2 = 'Knizetova1994';
comment.tW_f2 = 'Data for females S-line';
%
data.tW_m2 = [ ... % time since birth (d), weight (g)
   0    95
   7    360
   14   930
   21   1431
   28   2202
   35   2872
   42   3541
   49   4127
   56   4457
   63   4736
   92   5688
   154  5882
   192  6269
   217  6686];
units.tW_m2  = {'d', 'g'};  label.tW_m2 = {'time since birth', 'wet weight', 'S-line male'};  
temp.tW_m2    = C2K(41.2);  units.temp.tW_m2 = 'K'; label.temp.tW_m2 = 'temperature';
bibkey.tW_m2 = 'Knizetova1994';
comment.tW_m2 = 'Data for males S-line';
% D0line
data.tW_f3 = [ ... % time since birth (d), weight (g)
   0    97
   7    366
   14   863
   21   1316
   28   1918
   35   2422
   42   2898
   49   3349
   56   3695
   63   3817
   92   4452
   154  4793
   192  5269
   217  5729];
units.tW_f3  = {'d', 'g'};  label.tW_f3 = {'time since birth', 'wet weight', 'D-line female'};  
temp.tW_f3    = C2K(41.2);  units.temp.tW_f3 = 'K'; label.temp.tW_f3 = 'temperature';
bibkey.tW_f3 = 'Knizetova1994';
comment.tW_f3 = 'Data for females D-line';
%
data.tW_m3 = [ ... % time since birth (d), weight (g)
   0    97
   7    364
   14   882
   21   1394
   28   2038
   35   2621
   42   3152
   49   3631
   56   4033
   63   4248
   92   4929
   154  5133
   192  5556
   217  6027];
units.tW_m3  = {'d', 'g'};  label.tW_m3 = {'time since birth', 'wet weight', 'D-line male'};  
temp.tW_m3    = C2K(41.2);  units.temp.tW_m3 = 'K'; label.temp.tW_m3 = 'temperature';
bibkey.tW_m3 = 'Knizetova1994';
comment.tW_m3 = 'Data for males D-line';
% SxD-hyb
data.tW_f4 = [ ... % time since birth (d), weight (g)
   0    95
   7    353
   14   831
   21   1313
   28   1934
   35   2503
   42   3011
   49   3450
   56   3803
   63   3863
   92   4638
   154  4998
   192  5405
   217  5744];
units.tW_f4  = {'d', 'g'};  label.tW_f4 = {'time since birth', 'wet weight', 'SxD-hyb female'};  
temp.tW_f4    = C2K(41.2);  units.temp.tW_f4 = 'K'; label.temp.tW_f4 = 'temperature';
bibkey.tW_f4 = 'Knizetova1994';
comment.tW_f4 = 'Data for females SxD-line';
%
data.tW_m4 = [ ... % time since birth (d), weight (g)
   0    92
   7    348
   14   818
   21   1374
   28   2032
   35   2699
   42   3267
   49   3756
   56   4156
   63   4314
   92   5192
   154  5409
   192  5640
   217  5929];
units.tW_m4  = {'d', 'g'};  label.tW_m4 = {'time since birth', 'wet weight', 'SxD-hyb male'};  
temp.tW_m4    = C2K(41.2);  units.temp.tW_m4 = 'K'; label.temp.tW_m4 = 'temperature';
bibkey.tW_m4 = 'Knizetova1994';
comment.tW_m4 = 'Data for males SxD-line';
% DxS-hyb
data.tW_f5 = [ ... % time since birth (d), weight (g)
   0    95
   7    354
   14   824
   21   1241
   28   1932
   35   2416
   42   2909
   49   3358
   56   3661
   63   3710
   92   4465
   154  4902
   192  5310
   217  5757];
units.tW_f5  = {'d', 'g'};  label.tW_f5 = {'time since birth', 'wet weight', 'DxS-hyb female'};  
temp.tW_f5    = C2K(41.2);  units.temp.tW_f5 = 'K'; label.temp.tW_f5 = 'temperature';
bibkey.tW_f5 = 'Knizetova1994';
comment.tW_f5 = 'Data for females DxS-line';
%
data.tW_m5 = [ ... % time since birth (d), weight (g)
   0    96
   7    357
   14   880
   21   1365
   28   2034
   35   2711
   42   3274
   49   3733
   56   4066
   63   4179
   92   5077
   154  5349
   192  5596
   217  5920];
units.tW_m5  = {'d', 'g'};  label.tW_m5 = {'time since birth', 'wet weight', 'DxS-hyb male'};  
temp.tW_m5    = C2K(41.2);  units.temp.tW_m5 = 'K'; label.temp.tW_m5 = 'temperature';
bibkey.tW_m5 = 'Knizetova1994';
comment.tW_m5 = 'Data for males DxS-line';

% time-weight for embryo
data.tWe = [ ... age (d), weight (g)
      3  0.011
	  6  0.202
	  9  1.006
	 12  2.85
	 15  6.82
	 18 18.38
	 21 44.21
	 24 63.85
	 27 84.16
	 30 93.66];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'wet weight'};  
temp.tWe    = C2K(37.5);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'Roma1960';

% time-respiration for embryo
data.tJOe = [ ...
      5.58511488  10.60844487
      6.366656504 13.23911939
      7.488781077 22.77651642
	  9.718375017 47.46016564
	  10.51191899 78.17704356
	  11.34951701 90.94418744
	  11.36514493 72.9804775
	  11.74801336 84.40083834
	  12.41302076 122.917005
	  12.45415666 142.0318354
	  12.55877696 76.93697119
	  13.4384836  96.46409064
	  13.64663913 160.5895211
	  13.72926465 194.3265074
	  13.73067951 176.3558095
	  14.43505424 256.4501789
	  14.45103588 233.9937945
	  14.45227388 218.2694339
	  14.64993034 235.2147944
	  15.43781488 337.8144639
	  15.4639658  186.1936884
	  15.52592298 301.9149958
	  15.52804526 274.958949
	  15.66336689 361.5128121;
	  15.7427445  255.9699018
	  16.59691922 419.2556164
	  16.62693706 399.0525572
	  16.69207766 474.3397943 
	  16.69331566 458.6154337
	  16.75883391 348.5728609
	  17.57759665 600.5749205
	  17.58575601 316.4062721
	  17.6104442  544.4304655
	  17.62695641 515.2350693
	  17.68646152 481.5679626
	  17.72176114 574.8119218
	  17.74189892 499.5666123
	  18.36205642 566.1410306
	  18.49717726 835.7783664
	  18.59306707 701.0400599
	  18.61990148 721.271071
	  18.62900962 605.5847033
	  18.66669681 668.5031098
	  18.73990835 460.7448672
	  18.75321319 652.8206768
	  18.8731077  574.2547771
	  18.89452403 843.8362094
	  19.34085292 951.8840112
	  19.3977291  771.0748275
	  19.42199909 823.8777284
	  19.4581185  726.1760345
	  19.46899521 588.0262945
	  19.5129369  752.0368645
	  19.66671616 784.6856219
	  19.69953978 909.3783024
	  19.79319494 983.5563469
	  19.86216191 829.710198
	  19.93145865 852.2085101
	  20.24978154 961.3165889
	  20.32977814 847.9114982
	  20.37471647 818.730078
	  20.4068566  771.5709719
	  20.46534112 1111.932991
	  20.49792339 1059.158042
	  20.51121161 709.8456136
	  20.57137628 1028.867429
	  20.65411417 880.644111
	  20.79854394 851.5116065
	  20.85654577 836.9383662
	  20.85866805 809.9823194
	  21.04007759 852.7535702
	  21.23649605 885.4232915
	  21.2484984  913.5094949
	  21.29529373 860.7415337
	  21.44007722 827.1163546
	  21.50813597 865.3390274
	  21.52550852 1005.749081
	  21.65926238 931.6828433
	  21.68609679 951.9138544
	  21.72256992 849.719486
	  21.75068289 1214.777239
	  21.85055198 1029.496344
	  22.00152547 917.2493621
	  22.07902213 1016.130128
	  22.25851018 902.7739532
	  22.40990188 965.7482633
	  22.55495065 928.7535784
	  22.563239   1004.012864
	  22.58633548 1252.254092
	  22.5891007  1036.59873
	  22.75481782 917.6197235
	  22.75879711 867.0771357
	  22.79038273 1007.494177
	  22.80185451 1042.319392
	  22.80589829 1171.490771
	  22.85050684 965.9648897
	  23.05556736 1069.401222
	  23.05875079 1028.967152
	  23.06043093 1007.626948
	  23.06723993 921.1429643
	  23.14263825 866.1426417
	  23.28757466 1011.108261
	  23.34002942 886.4575081
	  23.44829191 1316.700968
	  23.49891361 1034.799621
	  23.50156647 1001.104563
	  23.66463073 915.8206151
	  23.7316044  1148.358447
	  23.75371154 867.5662922
	  23.7576024  818.146873
	  23.78892273 961.93342
	  24.01789952 1122.665328
	  24.17265151 1142.95923
	  24.21743692 935.1870117
	  24.26679668 849.8471605
	  24.29820544 992.5105389
	  24.33432485 894.808845
	  24.37154596 1144.18023
	  24.41515787 1131.846339
	  24.49692304 995.9778761
	  24.51807409 1268.928814
	  24.57594693 894.9276402
	  24.60143098 1112.843316
	  24.67340451 920.809434
	  24.76951174 1144.375893
	  24.78003473 1010.718827
	  24.80006015 1117.433822
	  24.86471805 837.7857996
	  24.94716671 873.7691231
	  24.95233613 1169.176446
	  24.96560041 1000.701153
	  24.98441176 942.3033727
	  25.19135322 841.3160284
	  25.25222532 1151.352495	
	  25.30240487 875.0669905
	  25.4623502  1009.93108
	  25.54150308 1268.308778
	  25.57209936 879.692436
	  25.57461592 1208.794817
	  25.61674847 1034.717657
	  25.65569759 901.0745675
	  25.75357339 1102.177654
	  25.75631467 1067.359427
	  25.78933909 1008.968634
	  25.88547024 1051.697958
	  25.95461407 895.6054714
	  25.97278248 1025.907007
	  26.02521331 1082.09339
	  26.11599819 831.6617276
	  26.13124846 999.0278276
	  26.19782786 875.5072314
	  26.21871362 1151.827675];
units.tJOe   = {'d', 'ml O_2/d'};  label.tJOe = {'age', 'O_2 consumption'};  
temp.tJOe    = C2K(37.5);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'VlecHoyt1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.tWe = 5 * weights.tWe;
weights.tJOe = 5 * weights.tJOe;
%weights.ab = 5 * weights.ab;
weights.Ri = 5 * weights.Ri;
%weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f2','tW_m2'}; subtitle2 = {'Data for females, males'};
set3 = {'tW_f3','tW_m3'}; subtitle3 = {'Data for females, males'};
set4 = {'tW_f4','tW_m4'}; subtitle4 = {'Data for females, males'};
set5 = {'tW_f5','tW_m5'}; subtitle5 = {'Data for females, males'};
metaData.grp.sets = {set1;set2;set3;set4;set5};
metaData.grp.subtitle = {subtitle1;subtitle2;subtitle3;subtitle4;subtitle5};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
D5 = 'mod_3: Puberty is assumed to coincide with fledging with a waiting time to first brood';
D6 = 'mod_4: tW 2 till 5 data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);  

%% Facts
F1 = 'The embryo data were analysed in ZonnKooy1993';
metaData.bibkey.F1 = 'ZonnKooy1993'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '679X7'; % Cat of Life
metaData.links.id_ITIS = '175028'; % ITIS
metaData.links.id_EoL = '45510528'; % Ency of Life
metaData.links.id_Wiki = 'Anser_anser'; % Wikipedia
metaData.links.id_ADW = 'Anser_anser'; % ADW
metaData.links.id_Taxo = '52000'; % Taxonomicon
metaData.links.id_WoRMS = '416682'; % WoRMS
metaData.links.id_avibase = '4AED44E819A43204'; % avibase
metaData.links.id_birdlife = 'greylag-goose-anser-anser'; % birdlife
metaData.links.id_AnAge = 'Anser_anser'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anser_anser}}';
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
bibkey='Knizetova1994'; type = 'Article'; bib = [...
'doi = {10.1080/00071669408417698}, '...
'author = { H.   Knizetova  and  J.   Hyanek  and  A.   Veselsky }, '...
'year={1994},'...
'title = {Analysis of growth curves of fowl. {I}{I}{I}. {G}eese}, '...
'journal = {British Poultry Science},'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hrou1988'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00071668808417026}, ' ...
'author = {Hrouz, J.}, ' ... 
'year = {1988}, ' ...
'title = {Growth and development of {B}ohemian geese (\emph{Anser anser})}, ' ...
'journal = {British Poultry Science}, ' ...
'volume = {29}, ' ...
'pages = {53-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Anser_anser}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SunShi2007'; type = 'Article'; bib = [ ...
'title = {Development of out-of-season laying in geese and its impact on the goose industry in {G}uangdong {P}rovince, {C}hina},' ...
'author = {A. D. Sun and Z. D. Shi and Y. M. Huang and S. D. Liang},' ...
'journal = {World''' 's Poultry Science Journal},' ...
'year = 2007,' ...
'volume = {63(3)}, ' ...
'pages = {481-490}, ' ...
'doi = {10.1017/S0043933907001596}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VlecHoyt1979'; type = 'Article'; bib = [...
'author = {Vleck, C. M. and Hoyt, D. F. and Vleck, D.}, '...
'year = {1979},'...
'title = {Metabolism of avian embryos: patterns in artricial and precocial birds}, '...
'journal = {Physiol. Zool. }, ' ...
'volume = {52}, ' ...
'pages = {363-377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Roma1960'; type = 'book'; bib = [...
'author = {Romanoff, A. L.}, '...
'year = {1960},'...
'title = {The avian embryo}, '...
'publisher = {MacMillan Company}, ' ...
'address = {New York}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZonnKooy1993'; type = 'article'; bib = [...
'author = {Zonneveld, C. and Kooijman, S. A. L. M.}, '...
'year = {1993}, '...
'title = {Comparative kinetics of embryo development}, '...
'journal = {Bull. Math. Biol.}, ' ...
'volume = {3}, ' ...
'pages = {609-635}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

