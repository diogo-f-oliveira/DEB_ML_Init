function [data, auxData, metaData, txtData, weights] = mydata_Leptodora_kindtii

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Haplopoda'; 
metaData.family     = 'Leptodoridae';
metaData.species    = 'Leptodora_kindtii'; 
metaData.species_en = 'Giant waterflea'; 

metaData.ecoCode.climate = {'Csa', 'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Wd'; 'L-JO_T'; 'T-JO'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 11 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 05]; 


%% set data
% zero-variate data

data.ab_15 = 14; units.ab_15 = 'd'; label.ab_15 = 'age at birth';          bibkey.ab_15 = 'Vijv1980';   
  temp.ab_15 = C2K(15);  units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.ab_20 = 7;  units.ab_20 = 'd'; label.ab_20 = 'age at birth';          bibkey.ab_20 = 'Vijv1980';   
  temp.ab_20 = C2K(20);  units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature';
data.ab_25 = 7;  units.ab_25 = 'd'; label.ab_25 = 'age at birth';          bibkey.ab_25 = 'Vijv1980';   
  temp.ab_25 = C2K(25);  units.temp.ab_25 = 'K'; label.temp.ab_25 = 'temperature';
data.tp = 4;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Vijv1980';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: 3 till 6 days';
data.am = 120;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.105e-5;   units.Wwb = 'mug';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Andr1948';
  comment.Wwb = 'based on egg diameter of 0.39 mm: pi/6*0.039^3';

data.Lb  = 0.18; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Vijv1980';
data.Lp  = 0.653; units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vijv1980';
  comment.Lp = 'Wiki: 6 mm';
data.Li  = 2.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Vijv1980';
data.Lim  = 0.95;  units.Lim  = 'cm';  label.Lim  = 'ultimate total lengthm';   bibkey.Lim  = 'Andr1948';

data.Ri  = 2*7;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MoshCumm1969';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'broods each 12 h (Wiki), but 1/week in Vijv1980; Andr1948: number of eggs/brood varies greatly';
 
% uni-variate data
% time-length
data.tL = [ ... % time (d), length (mm)
0.232	1.822
7.193	3.711
13.947	5.037
20.994	6.204
28.175	6.635
35.055	7.352
42.081	7.794
56.295	9.236
63.321	9.792];
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vijv1980';
  
% L-Wd data
LNW = [ ... % length (mm), numbers per m^3, dry weight 1e-6 mg/ m^3 
 4  0.051  4.08
 5  0.253 25.30 
 6  0.202 24.24
 7  0.152 22.80 
 8  0.101 16.16
 9  0.152 27.36 
13  0.051 13.26];
data.LWd = [LNW(:,1)/ 10, LNW(:,3)./LNW(:,2)]; % cm, 1e-9 g
units.LWd   = {'cm', 'mg'};  label.LWd = {'length', 'dry weight'};  
bibkey.LWd = 'MoshCumm1969';

% L-JO_T data from MoshCumm1969, Tab 1
% length-group, T (C), sex, eggs/female (light/dark)
%   O2 cons (ml/h.mg dry wt, light/dark), RQ (light/dark)
% length groups
%  A = 0.35; % cm, (2-5 mm)
%  B = 0.65; % cm, (6-7 mm)
%  C = 0.85; % cm, (8-9 mm)
%  D = 1.10; % cm, (10-12 mm)
M = 0; % male
F = 1; % female with summer eggs
FF =2; % female with winter eggs
LTJO = [ ...
0.350  5   F  0   0    0.0061   0        0.61   0
0.351  5   M  0   0    0.0069   0.0022   0.58   0.57 
0.650  5   F  0   0    0.0045   0.0016   0.60   0.60
0.651  5   M  0   0    0.0040   0.0017   0.57   0.57 
0.652  5   F  6.3 6.7  0.0033   0.0017   0.56   0.60 
0.850  5   F  0   0    0.0053   0.0018   0.60   0.59 
0.851  5   F  6.0 6.3  0.0030   0.0014   0.59   0.59 
0.852  5   M  0   0    0.0043   0.0016   0.58   0.57 
1.100  5   F  0   0    0.0051   0.0016   0.61   0.61 
1.101  5   F  6.0 6.7  0.0037   0.0011   0.61   0.63 
0.350 10   F  0   0    0.0247   0.0100   0.61   0.63
0.351 10   M  0   0    0.0317   0.0157   0.63   0.62
0.650 10   F  0   0    0.0174   0.0099   0.64   0.63
0.651 10   F  6.3 5.3  0.0130   0.0107   0.59   0.63
0.652 10   M  0   0    0.0183   0.0116   0.62   0.62
0.850 10   F  0   0    0.0206   0.0107   0.63   0.63
0.851 10   F  5.7 5.7  0.0142   0.0091   0.65   0.63
0.852 10   M  0   0    0.0201   0.0116   0.63   0.62
1.100 10   F  5.3 5.3  0.0120   0.0073   0.62   0.63 
1.101 10   F  0   0    0.0241   0.0120   0.63   0.63
0.350 15   F  0   0    0.0490   0.0279   0.76   0.75
0.351 15   M  0   0    0.1289   0.0633   0.79   0.76
0.650 15   F  0   0    0.0383   0.0185   0.72   0.70
0.651 15   F  5.7 5.7  0.0220   0.0129   0.71   0.70
0.652 15   M  0   0    0.0936   0.0388   0.78   0.75
0.850 15   F  0   0    0.0424   0.0195   0.70   0.71 
0.851 15   F  5.7 5.3  0.0201   0.0149   0.70   0.70
0.852 15   FF 6.7 0    0.0295   0        0.72   0 
0.853 15   M  0   0    0.0959   0.0401   0.77   0.76
1.100 15   F  0   0    0.0381   0.0212   0.70   0.73
1.101 15   F  5.7 5.0  0.0269   0.0196   0.72   0.74
1.102 15   FF 7.0 0    0.0277   0        0.72   0 
0.350 20   F  0   0    0.1417   0.0779   0.87   0.84
0.351 20   M  0   0    0.1906   0.0961   0.87   0.84
0.650 20   F  0   0    0.0842   0.0610   0.82   0.81
0.651 20   F  6.3 5.0  0.0613   0.0336   0.83   0.82
0.652 20   M  0   0    0.1117   0.0636   0.83   0.82 
0.850 20   F  0   0    0.0904   0.0570   0.82   0.81
0.851 20   F  5.7 5.3  0.0552   0.0434   0.81   0.80
0.852 20   FF 5.3 0    0.0662   0        0.84   0 
0.853 20   M  0   0    0.1089   0.0599   0.81   0.81
1.100 20   F  0   0    0.0814   0.0621   0.82   0.81
1.101 20   F  5.7 5.7  0.0549   0.0356   0.81   0.79
1.102 20   FF 5.7 0    0.0607   0        0.84   0 
0.350 22.5 F  0   0    0.1459   0.0816   0.92   0.87
0.351 22.5 M  0   0    0.1873   0.1071   0.92   0.86
0.650 22.5 F  0   0    0.0955   0.0709   0.84   0.81
0.651 22.5 F  5.3 6.0  0.0686   0.0304   0.83   0.84
0.652 22.5 M  0   0    0.1117   0.0794   0.83   0.81
0.850 22.5 F  0   0    0.1020   0.0609   0.82   0.80
0.851 22.5 F  6.0 5.7  0.0679   0.0485   0.82   0.82
0.852 22.5 M  0   0    0.1101   0.0686   0.81   0.81
1.100 22.5 F  6.7 5.7  0.0588   0.0400   0.83   0.82
1.101 22.5 F  0   0    0.0927   0.0605   0.82   0.82 
0.350 25   F  0   0    0.1397   0.0788   0.92   0.86
0.351 25   M  0   0    0.1957   0.1126   0.93   0.86
0.352 25   F  0   0    0.1111   0.0688   0.85   0.81
0.650 25   F  6.0 5.7  0.0679   0.0346   0.83   0.83
0.651 25   M  0   0    0.1067   0.0730   0.83   0.83
0.850 25   F  0   0    0.1084   0.0585   0.83   0.81
0.851 25   F  4.7 5.7  0.0686   0.0507   0.83   0.82
0.852 25   M  0   0    0.1061   0.0626   0.82   0.81
1.100 25   F  0   0    0.0984   0.0626   0.82   0.82
1.101 25   F  5.3 5.0  0.0611   0.0443   0.83   0.81
0.350 30   F  0   0    0.2670   0.1605   0.95   0.90
0.351 30   M  0   0    0.2489   0.1648   0.94   0.92
0.650 30   F  0   0    0.1724   0.1250   0.87   0.85
0.651 30   F  6.0 5.0  0.0928   0.0747   0.84   0.84
0.652 30   M  0   0    0.1387   0.0953   0.85   0.84
0.850 30   F  0   0    0.1565   0.0997   0.84   0.83
0.851 30   F  6.3 6.0  0.0967   0.0745   0.83   0.84
0.852 30   M  0   0    0.1210   0.0820   0.84   0.83
1.100 30   F  0   0    0.1379   0.0878   0.84   0.84
1.101 30   F  6.3 5.3  0.0793   0.0585   0.84   0.83];
data.LJO_5 = LTJO(1:10,[1 6]);
units.LJO_5 = {'cm', 'ml/h.mg dry wt'}; label.LJO_5 = {'length', 'O_2 consumption', '5 C'};  
temp.LJO_5 = C2K(5); units.temp.LJO_5 = 'K'; label.temp.LJO_5= 'temperature';
bibkey.LJO_5 = 'MoshCumm1969';
%
data.LJO_10 = LTJO(11:20,[1 6]);
units.LJO_10 = {'cm', 'ml/h.mg dry wt'}; label.LJO_10 = {'length', 'O_2 consumption', '10 C'};  
temp.LJO_10 = C2K(10); units.temp.LJO_10 = 'K'; label.temp.LJO_10 = 'temperature';
bibkey.LJO_10 = 'MoshCumm1969';
%
data.LJO_15 = LTJO(21:32,[1 6]);
units.LJO_15 = {'cm', 'ml/h.mg dry wt'}; label.LJO_15 = {'length', 'O_2 consumption', '15 C'};  
temp.LJO_15 = C2K(15); units.temp.LJO_15 = 'K'; label.temp.LJO_15 = 'temperature';
bibkey.LJO_15 = 'MoshCumm1969';
%
data.LJO_20 = LTJO(33:44,[1 6]);
units.LJO_20 = {'cm', 'ml/h.mg dry wt'}; label.LJO_20 = {'length', 'O_2 consumption', '20 C'};  
temp.LJO_20 = C2K(20); units.temp.LJO_20 = 'K'; label.temp.LJO_20 = 'temperature';
bibkey.LJO_20 = 'MoshCumm1969';
%
data.LJO_22 = LTJO(45:54,[1 6]);
units.LJO_22 = {'cm', 'ml/h.mg dry wt'}; label.LJO_22 = {'length', 'O_2 consumption', '22.5 C'};  
temp.LJO_22 = C2K(22.5); units.temp.LJO_22 = 'K'; label.temp.LJO_22 = 'temperature';
bibkey.LJO_22 = 'MoshCumm1969';
%
data.LJO_25 = LTJO(55:64,[1 6]);
units.LJO_25 = {'cm', 'ml/h.mg dry wt'}; label.LJO_25 = {'length', 'O_2 consumption', '25 C'};  
temp.LJO_25 = C2K(25); units.temp.LJO_25 = 'K'; label.temp.LJO_25 = 'temperature';
bibkey.LJO_25 = 'MoshCumm1969';
%
data.LJO_30 = LTJO(65:74,[1 6]);
units.LJO_30 = {'cm', 'ml/h.mg dry wt'}; label.LJO_30 = {'length', 'O_2 consumption', '30 C'};  
temp.LJO_30 = C2K(30); units.temp.LJO_30 = 'K'; label.temp.LJO_30 = 'temperature';
bibkey.LJO_30 = 'MoshCumm1969';

% T-JO data
data.TJO = [ ... % temp (C), O2-consumption (10^-4 ml O2/h)
 5	  15.02563063
10	  57.83638683
15	  105.28040652
20    207.39456993
22.5  221.85008239
25	  229.35572938
30	  267.53539683];
units.TJO   = {'C', '10^{-4} ml O2/h'};  label.TJO = {'temperature', 'O_2 consumption'};  
bibkey.TJO = 'MoshCumm1969';
comment.TJO = 'Lw = 1.1 cm';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.Lb = 2 * weights.Lb;
weights.Li = 2 * weights.Li;
weights.LWd = 3 * weights.LWd;
weights.tp = 0 * weights.tp;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LJO_30','LJO_25','LJO_22','LJO_20','LJO_15','LJO_10','LJO_5'}; subtitle1 = {'Data at 30, 25, 22.5, 20, 15, 10, 5 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'a nauplius type of larva hatches from winter eggs; parthenogenetics during summer, males fevelop in autumn';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'log10(W in mug) = -0.47 + 2.93 * log10(L in mm)';
metaData.bibkey.F2 = 'VijvFran1976'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3TNWV'; % Cat of Life
metaData.links.id_ITIS = '83972'; % ITIS
metaData.links.id_EoL = '46498370'; % Ency of Life
metaData.links.id_Wiki = 'Leptodora_kindtii'; % Wikipedia
metaData.links.id_ADW = 'Leptodora_kindtii'; % ADW
metaData.links.id_Taxo = '33097'; % Taxonomicon
metaData.links.id_WoRMS = '247980'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptodora_kindtii}}';
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
bibkey = 'Vijv1980'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J.}, ' ... 
'year = {1980}, ' ...
'title = {Effect of temperature in laboratory studies on the development and growth of Cladocera and copepoda from {T}jeukemeer, the {N}etherlands}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {10}, ' ...
'pages = {317--340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoshCumm1969'; type = 'Article'; bib = [ ... 
'author = {Moshiri, G. A. and Cummins, K. W. and Costa, R. R.}, ' ... 
'year = {1969}, ' ...
'title = {Respiratory energy expenditure by the predaceous zooplankter \emph{Leptodora kindtii} ({F}ocke) ({C}rustacea: {C}ladocera)}, ' ...
'journal = {Limnol Oceanogr}, ' ...
'volume = {14}, ' ...
'pages = {475--484}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VijvFran1976'; type = 'Article'; bib = [ ... 
'author = {Vijverberg, J. and Frank, Th. H.}, ' ... 
'year = {1976}, ' ...
'title = {The chemical composition and the energy contents of copepods and cladocerans in relation to their size}, ' ...
'journal = {Freshwater Biol}, ' ...
'volume = {6}, ' ...
'pages = {333--345}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Andr1948'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3223082}, ' ...
'author = {Ted F. Andrews}, ' ... 
'year = {1948}, ' ...
'title = {The Parthenogenic Reproductive Cycle of the Cladoceran, \emph{Leptodora kindtii}}, ' ...
'journal = {Transactions of the American Microscopical Society}, ' ...
'volume = {67(1)}, ' ...
'pages = {54–60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

