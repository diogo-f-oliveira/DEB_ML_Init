function [data, auxData, metaData, txtData, weights] = mydata_Ceriodaphnia_dubia 

%% set metaData

metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Ceriodaphnia_dubia';  
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Tbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdi';'Ni'; };  % tags for different types of zero-variate data
metaData.data_1     = {'T-ab';'T-ap';'t-N_T';'t-L_T'; }; % tags for different types of uni-variate data

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Kim Rakel'};           
metaData.date_subm = [2016 12 14];  
metaData.email    = {'rakel@gaiac-eco.de'}; 
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 03]; 

%% set data
% zero-variate data;

data.ab = 2;   units.ab = 'd';  label.ab = 'age at birth';         bibkey.ab = 'AndeBenk1994';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3.6;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AndeBenk1994';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 59;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'AndeBenk1994';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
% length = eye to origin of apical spine 
data.Lb = 0.036;      units.Lb = 'cm';    label.Lb = 'length at birth';  bibkey.Lb = 'AndeBenk1994';    
  temp.Lb= C2K(15);  units.temp.Lb = 'K'; label.temp.Lb = 'temperature';
data.Lp  = 0.063;   units.Lp  = 'cm';   label.Lp  = 'length at puberty';  bibkey.Lp  = 'AndeBenk1994';
  temp.Lp= C2K(15);  units.temp.Lp = 'K'; label.temp.Lp = 'temperature';
data.Li  = 0.09832;   units.Li  = 'cm';   label.Li  = 'ultimate length';    bibkey.Li  = 'AndeBenk1994';
  temp.Li= C2K(15);  units.temp.Li = 'K'; label.temp.Li = 'temperature';
 
% weight
data.Wdb = 8.8e-7;  units.Wdb = 'g';    label.Wdb = 'dry weight at birth';          bibkey.Wdb = 'AndeBenk1994';
data.Wdi = 6.71e-6; units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';          bibkey.Wdi = 'AndeBenk1994';

% reproduction
data.Ni = 75.9; units.Ni = '#'; label.Ni = 'total number of offspring'; bibkey.Ni = 'AndeBenk1994';
  temp.Ni = C2K(25);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data

% temperature-age at birth
 data.Tab = [ ... % temperature (C), age at birth
    10 11.2
    15 4.5
    20 3.4
    25 2 ];
 data.Tab(:,2);
 units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'}; 
 bibkey.Tab = 'AndeBenk1994';
 
% temperature-time at puberty
 data.Ttp = [ ... temperature (C), time since birth at puberty (d)
     10 13.4
     15  4.4
     20  3.8
     25  3.6];
 data.Ttp(:,2);
 units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
 bibkey.Ttp = 'AndeBenk1994';
 
% temperature-lifespan
 data.Ttm = [ ... temperature (C), max lifespan(d)
     10  133
     15  80
     20  73
     25  59];
 units.Ttm   = {'C', 'd'};  label.Ttm = {'temperature', 'lifespan'};  
 bibkey.Ttm = 'AndeBenk1994';
 
% time-cum number of eggs
data.tN_10 = [ ... % time since birth (d), cumulative number of eggs
0	0
9.98	0
19.66	1.99
29.94	1.99
39.92	3.97
49.90	5.96
59.88	7.95
69.86	9.75
79.84	9.93
89.82	9.93
99.80	10.84
109.80	11.74
119.80	11.92
129.70	12.64
139.70	12.82];
units.tN_10   = {'d', '#'};  label.tN_10 = {'time since birth', 'cumulative # of eggs', '10 C'};  
temp.tN_10    = C2K(10);  units.temp.tN_10 = 'K'; label.temp.tN_10 = 'temperature';
bibkey.tN_10 = 'AndeBenk1994';
%
data.tN_15 = [ ... % time since birth (d), cumulative number of eggs
0.30	0.18
9.98	2.71
19.96	8.67
29.64	18.60
39.92	26.73
49.90	35.58
59.88	41.53
69.86	43.52
79.84	43.52];
units.tN_15   = {'d', '#'};  label.tN_15 = {'time since birth', 'cumulative # of eggs', '15 C'};  
temp.tN_15    = C2K(15);  units.temp.tN_15 = 'K'; label.temp.tN_15 = 'temperature';
bibkey.tN_15 = 'AndeBenk1994';
%
data.tN_20 = [ ... % time since birth (d), cumulative number of eggs
0	0
9.98	5.06
19.66	16.98
29.64	29.98
39.92	38.83
49.90	49.84
59.58	57.07
69.86	57.97];
units.tN_20   = {'d', '#'};  label.tN_20 = {'time since birth', 'cumulative # of eggs', '20 C'};  
temp.tN_20    = C2K(20);  units.temp.tN_20 = 'K'; label.temp.tN_20 = 'temperature';
bibkey.tN_20 = 'AndeBenk1994';
%
data.tN_25 = [ ... % time since birth (d), cumulative number of eggs
0	0.18
9.98	12.64
19.66	37.92
29.64	52.73
39.92	62.84
49.60	71.69
59.58	75.85];
units.tN_25   = {'d', '#'};  label.tN_25 = {'time since birth', 'cumulative # of eggs', '25 C'};  
temp.tN_25    = C2K(25);  units.temp.tN_25 = 'K'; label.temp.tN_25 = 'temperature';
bibkey.tN_25 = 'AndeBenk1994';

% time-length
 data.tL_10 = [ ... % time (d), change in length (mm), temperature=10 Degree Celcius
 0      0.36
 2      0.3719
 4      0.3707
 5      0.3935
 6      0.4223
 9      0.445
 11     0.4582
 12     0.4846
 13     0.511
 15     0.5205
 17     0.5325
 18     0.5565
 20     0.5913
 22     0.6045
 24     0.6224
 25     0.644
 25     0.6584
 28     0.6584
 29     0.6656
 32     0.6692
 33     0.6848
 34     0.692
 38     0.6896
 40     0.6943
 44     0.6979
 47     0.7147
 53     0.7243
 56     0.7351
 58     0.7507
 61     0.7579
 63     0.7675
 66     0.7723
 70     0.7783
 72     0.7842
 76     0.7795
 79     0.7854
 82     0.7914
 86     0.789
 87     0.8058
 88     0.8178
 92     0.8214
 96     0.8202
 98     0.8298
 103	0.831
 105	0.8322
 107	0.837
 111	0.8394
 114	0.831
 119	0.8286
 121	0.8454
 127	0.8442
 131	0.8442];    
 data.tL_10(:,2) = data.tL_10(:,2)/ 10; % convert mm to cm
 units.tL_10   = {'d', 'cm'};  label.tL_10 = {'time', 'length', '10 C'};  
 temp.tL_10    = C2K(10);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature'; bibkey.tL_10 = 'AndeBenk1994';
 %
 data.tL_15 = [ ... % time (d), change in length (mm), temperature=15 Degree Celcius
 0	0.3551
 2	0.4019
 3	0.4618
 4	0.4834
 5	0.5193
 6	0.5457
 7	0.5769
 9	0.6104
 11	0.6332
 13	0.6488
 15	0.674
 17	0.6884
 18	0.7111
 21	0.7279
 22	0.7495
 25	0.7603
 26	0.7783
 29	0.783
 32	0.8058
 34	0.8106
 35	0.8358
 37	0.8634
 39	0.8741
 42	0.8825
 44	0.8933
 47	0.8921
 48	0.9125
 50	0.9245
 54	0.9269
 56	0.9245
 58	0.9425
 59	0.9485
 61	0.9497
 62	0.9664
 65	0.9688
 67	0.9772
 70	0.982
 72	0.9832
 74	0.9832
 75	0.9712
 77	0.9712];    
 data.tL_15(:,2) = data.tL_15(:,2)/ 10; % convert mm to cm
 units.tL_15   = {'d', 'cm'};  label.tL_15 = {'time', 'length', '15 C'};  
 temp.tL_15    = C2K(15);  units.temp.tL_15 = 'K'; label.temp.tL_15 = 'temperature'; bibkey.tL_15 = 'AndeBenk1994';
%
 data.tL_20 = [ ... % time (d), change in length (mm), temperature=20 Degree Celcius
 0	0.3515
 1	0.457
 3	0.4978
 4	0.5146
 5	0.5373
 6	0.6344
 8	0.6572
 10	0.7003
 11	0.7315
 13	0.7591
 15	0.7735
 17	0.783
 18	0.8046
 19	0.8202
 21	0.825
 24	0.825
 25	0.849
 28	0.8622
 30	0.8622
 31	0.8825
 32	0.8897
 35	0.8897
 37	0.8909
 38	0.9065
 41	0.9197
 43	0.9305
 45	0.9329
 48	0.9329
 49	0.9473
 51	0.9545
 53	0.9664
 56	0.9628
 59	0.964
 62	0.97
 64	0.9545
 65	0.9017
 68	0.9005
 71	0.9029];    
 data.tL_20(:,2) = data.tL_20(:,2)/ 10; % convert mm to cm
 units.tL_20   = {'d', 'cm'};  label.tL_20 = {'time', 'length', '20 C'};  
 temp.tL_20    = C2K(20);  units.temp.tL_20 = 'K'; label.temp.tL_20 = 'temperature'; bibkey.tL_20 = 'AndeBenk1994';
%
 data.tL_25 = [ ... % time (d), change in length (mm), temperature=25 Degree Celcius
 0	0.3604
 2	0.5205
 3	0.5373
 4	0.5661
 5	0.5865
 6	0.6332
 7	0.656
 8	0.6872
 9	0.7147
 10	0.7387
 11	0.7591
 13	0.7711
 14	0.783
 15	0.7902
 17	0.8022
 19	0.8202
 20	0.8346
 22	0.8442
 24	0.8538
 25	0.8646
 26	0.8801
 28	0.8873
 29	0.9017
 30	0.9221
 31	0.9377
 33	0.9389
 35	0.9413
 38	0.9449
 39	0.9413
 41	0.9413
 43	0.9461
 44	0.9521
 46	0.9509
 48	0.9616
 49	0.9676
 51	0.9712
 53	0.9688
 54	0.976
 55	0.9616
 57	0.958];    
 data.tL_25(:,2) = data.tL_25(:,2)/ 10; % convert mm to cm
 units.tL_25   = {'d', 'cm'};  label.tL_25 = {'time', 'length', '25 C'};  
 temp.tL_25    = C2K(25);  units.temp.tL_25 = 'K'; label.temp.tL_25 = 'temperature'; bibkey.tL_25 = 'AndeBenk1994';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdb = weights.Wdb * 0;  % probably not reliable because of inaccuracy of measurement, or weighing error 
weights.tN_25 = weights.tN_25 * 0;
weights.tN_20 = weights.tN_20 * 0;
weights.tN_15 = weights.tN_15 * 0;
weights.tN_10 = weights.tN_10 * 0;
weights.tL_25 = weights.tL_25 * 30; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
if exist('comment','var')
  txtData.comment = comment;
end

%% Group plots
set1 = {'tL_10','tL_15', 'tL_20', 'tL_25'}; subtitle1 = {'AndeBenk1994 data at 25, 20, 15, 10 C'};
set2 = {'tN_25','tN_20','tN_15','tN_10'}; subtitle2 = {'AndeBenk1994 data at 25, 20, 15, 10 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Links
metaData.links.id_CoL = 'SY66'; % Cat of Life
metaData.links.id_ITIS = '83912'; % ITIS
metaData.links.id_EoL = '338927'; % Ency of Life
metaData.links.id_Wiki = 'Ceriodaphnia_dubia'; % Wikipedia
metaData.links.id_ADW = 'Ceriodaphnia_dubia'; % ADW
metaData.links.id_Taxo = '156172'; % Taxonomicon
metaData.links.id_WoRMS = '1302376'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ceriodaphnia_dubia}}';
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
bibkey = 'AndeBenk1994'; type = 'Article'; bib = [...% type can be article, book or conference
'author = {Anderson, D. H. and Benke, A. C.}, ' ... 
'year = {1994}, ' ...
'title = {Growth and reproduction of the cladoceran \emph{Ceriodaphnia dubia} from a forested floodplain swamp}, ' ...
'journal = {Limnol. Oceanogr.}, ' ...
'volume = {39}, ' ...
'number = {7}, '...
'pages = {1517-1527}, '...
'doi = {10.4319/lo.1994.39.7.1517}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
