function [data, auxData, metaData, txtData, weights] = mydata_Moina_macrocopa
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Moinidae';
metaData.species    = 'Moina_macrocopa'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'; 't-S_T'; 'X-Li'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 18]; 

%% set data
% zero-variate data

data.ab = 33/24;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'MartGuti1991';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on inter-clutch time of 33 h';
data.tp = 2;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BeniTifn2002';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 

data.Lb  = 0.05; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'BeniTifn2002';
data.Lp  = 0.11; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BeniTifn2002';
data.Li  = 0.18;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BeniTifn2002';

data.Wdb = 8.81e-7;   units.Wdb = 'g';   label.Wdb = 'dry weight birth';     bibkey.Wdb = 'guess';
  comment.Wdb = 'guess based on (Lb/Li)^3*Wdi';
data.Wdp = 9.38e-6;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';  bibkey.Wdp = 'guess';
  comment.Wdi = 'guess based on (Lp/Li)^3*Wdi';
data.Wdi = 4.11e-5;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';    bibkey.Wdi = 'guess';
  comment.Wdi = 'computed from length-weight of Ceriodaphnia dubia: (0.18/0.09832)^3*6.71e-06';
  
data.Ri  = 27/33*24;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'MartGuti1991';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '27 young per clutch, 33 h between clutches';
 
% uni-variate data

% t-L data
data.tL1 = [ ... % time since birth (d), length (cm)
0.005	0.054
0.968	0.079
1.968	0.112
2.903	0.124
3.968	0.132
4.935	0.143
5.968	0.150
6.935	0.153
7.935	0.158
8.903	0.162
9.935	0.166
10.935	0.169
11.903	0.173
12.903	0.181];
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'length', '25 C, 625e3 cells/ml'};  
temp.tL1    = C2K(25);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'BeniTifn2002';
comment.tL1 = '625e3 cells Chlorella sorokiniana/ml';
% t-L data
data.tL2 = [ ... % time since birth (d), length (cm)
0.000	0.054
0.968	0.072
1.968	0.098
2.968	0.105
3.935	0.110
5.032	0.114
5.968	0.116
6.935	0.120
8.000	0.121
8.935	0.122
9.968	0.124
10.903	0.125
11.903	0.126
12.935	0.125
13.839	0.127
14.935	0.130
15.903	0.130];
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'length', '25 C, 62500 cells/ml'};  
temp.tL2    = C2K(25);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'BeniTifn2002';
comment.tL2 = '62500 cells Chlorella sorokiniana/ml';
% t-L data
data.tL3 = [ ... % time since birth (d), length (cm)
0.032	0.052
0.935	0.066
2.000	0.081
2.935	0.092
4.000	0.098
4.935	0.100
5.968	0.103
7.000	0.105
7.968	0.108
8.935	0.109
9.935	0.110
10.968	0.111
11.903	0.112
12.968	0.113
13.935	0.115
14.968	0.116
15.935	0.116
16.871	0.117
17.903	0.117
18.935	0.118
19.935	0.122
20.968	0.123
21.968	0.126];
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since birth', 'length', '31250 cells/ml'};  
temp.tL3    = C2K(25);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'BeniTifn2002';
comment.tL3 = '31250 cells Chlorella sorokiniana/ml';
% t-L data
data.tL4 = [ ... % time since birth (d), length (cm)
0.032	0.052
1.000	0.064
1.968	0.071
2.935	0.078
4.000	0.084
5.000	0.089
5.968	0.092
7.000	0.095
8.000	0.097
8.839	0.099
9.968	0.099
10.871	0.101
11.968	0.102
12.903	0.104
13.935	0.105
14.935	0.105
15.903	0.104
16.968	0.105
18.000	0.105
18.935	0.106
19.968	0.107
20.935	0.106
21.935	0.108];
units.tL4   = {'d', 'cm'};  label.tL4 = {'time since birth', 'length', '25 C, 15625 cells/ml'};  
temp.tL4    = C2K(25);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'BeniTifn2002';
comment.tL4 = '15625 cells Chlorella sorokiniana/ml';
% t-L data
data.tL5 = [ ... % time since birth (d), length (cm)
0.032	0.050
0.968	0.060
1.968	0.065
2.935	0.067
3.935	0.070
4.968	0.074
6.000	0.076
6.935	0.078
8.000	0.079
8.871	0.081
9.968	0.083
10.903	0.083
11.903	0.087
12.903	0.087];
units.tL5   = {'d', 'cm'};  label.tL5 = {'time since birth', 'length', '25 C, 6250 cells/ml'};  
temp.tL5    = C2K(25);  units.temp.tL5 = 'K'; label.temp.tL5 = 'temperature';
bibkey.tL5 = 'BeniTifn2002';
comment.tL5 = '6250 cells Chlorella sorokiniana/ml';
% t-L data
data.tL6 = [ ... % time since birth (d), length (cm)
0.032	0.050
0.935	0.054
1.968	0.056
3.000	0.057
4.000	0.058
5.000	0.060
5.968	0.062
7.000	0.069
7.935	0.071
8.935	0.075
9.968	0.086];
units.tL6   = {'d', 'cm'};  label.tL6 = {'time since birth', 'length', '25 C, 625 cells/ml'};  
temp.tL6    = C2K(25);  units.temp.tL6 = 'K'; label.temp.tL6 = 'temperature';
bibkey.tL6 = 'BeniTifn2002';
comment.tL6 = '625 cells Chlorella sorokiniana/ml';
% t-L data
data.tL7 = [ ... % time since birth (d), length (cm)
0.129	0.050
0.935	0.053
1.935	0.054
3.000	0.052
4.032	0.054
4.935	0.054];
units.tL7   = {'d', 'cm'};  label.tL7 = {'time since birth', 'length', '25 C, 6.25 cells/ml'};  
temp.tL7    = C2K(25);  units.temp.tL7 = 'K'; label.temp.tL7 = 'temperature';
bibkey.tL7 = 'BeniTifn2002';
comment.tL7 = '6.25 cells Chlorella sorokiniana/ml';
% 30 C
data.tL130 = [ ... % time since birth (d), length (cm)
0.066	0.061
0.973	0.108
2.046	0.128
3.047	0.141
4.076	0.149
5.038	0.157
6.064	0.163
7.122	0.168
8.014	0.172];
units.tL130   = {'d', 'cm'};  label.tL130 = {'time since birth', 'length', '30 C, 625e3 cells/ml'};  
temp.tL130    = C2K(30);  units.temp.tL130 = 'K'; label.temp.tL130 = 'temperature';
bibkey.tL130 = 'BeniTifn2002';
comment.tL130 = '625e3 cells Chlorella sorokiniana/ml';
% 20 C
data.tL120 = [ ... % time since birth (d), length (cm)
0.097	0.060
1.015	0.087
2.024	0.107
3.056	0.119
4.085	0.128
5.016	0.136
6.075	0.143
7.067	0.148
8.060	0.154
9.017	0.156
10.074	0.161
11.032	0.165
12.022	0.168
13.044	0.170
14.001	0.174
14.989	0.174
16.080	0.180];
units.tL120   = {'d', 'cm'};  label.tL120 = {'time since birth', 'length', '20 C, 625e3 cells/ml'};  
temp.tL120    = C2K(20);  units.temp.tL120 = 'K'; label.temp.tL120 = 'temperature';
bibkey.tL120 = 'BeniTifn2002';
comment.tL120 = '625e3 cells Chlorella sorokiniana/ml';
% 18 C
data.tL118 = [ ... % time since birth (d), length (cm)
0.058	0.054
1.025	0.066
2.023	0.077
2.990	0.088
4.060	0.104
4.964	0.119
6.088	0.124
7.078	0.128
8.036	0.131
9.061	0.137
10.014	0.137
11.038	0.140
12.061	0.144
13.016	0.145
14.037	0.147
15.026	0.149
16.080	0.150
17.036	0.152
18.057	0.154
19.077	0.154
20.034	0.157
21.053	0.157
22.073	0.157];
units.tL118   = {'d', 'cm'};  label.tL118 = {'time since birth', 'length', '18 C, 625e3 cells/ml'};  
temp.tL118    = C2K(18);  units.temp.tL118 = 'K'; label.temp.tL118 = 'temperature';
bibkey.tL118 = 'BeniTifn2002';
comment.tL118 = '625e3 cells Chlorella sorokiniana/ml';
% 15 C
data.tL115 = [ ... % time since birth (d), length (cm)
0.058	0.054
0.982	0.057
2.078	0.067
3.040	0.074
4.069	0.083
5.070	0.096
6.062	0.101
7.089	0.108
8.054	0.118
9.076	0.120
10.030	0.121
11.051	0.122
12.038	0.123
13.032	0.130
14.020	0.131
15.008	0.132
16.028	0.132
16.982	0.133
18.001	0.132
19.056	0.135
20.010	0.135];
units.tL115   = {'d', 'cm'};  label.tL115 = {'time since birth', 'length', '15 C, 625e3 cells/ml'};  
temp.tL115    = C2K(15);  units.temp.tL115 = 'K'; label.temp.tL115 = 'temperature';
bibkey.tL115 = 'BeniTifn2002';
comment.tL115 = '625e3 cells Chlorella sorokiniana/ml';

% t-Survival data
data.tS1 = [ ... % time since birth (d), surviving fraction (-)
1.000	1.000
1.985	1.000
2.985	0.851
3.926	0.645
4.918	0.399
5.451	0.227
6.007	0.000];
units.tS1   = {'d', '-'};  label.tS1 = {'time since birth', 'surviving fraction', '25 C'};  
temp.tS1    = C2K(25);  units.temp.tS1 = 'K'; label.temp.tS1 = 'temperature';
bibkey.tS1 = 'BeniTifn2002';
comment.tS1 = '625e3 cells Chlorella sorokiniana/ml';
% 30 C
data.tS130 = [ ... % time since birth (d), surviving fraction (-)
5.980	1.000
6.840	0.871
7.848	0.556
8.400	0.320
8.583	0.223
8.946	0.000];
units.tS130   = {'d', '-'};  label.tS130 = {'time since birth', 'surviving fraction', '30 C'};  
temp.tS130    = C2K(30);  units.temp.tS130 = 'K'; label.temp.tS130 = 'temperature';
bibkey.tS130 = 'BeniTifn2002';
comment.tS130 = '625e3 cells Chlorella sorokiniana/ml';
% 20 C
data.tS120 = [ ... % time since birth (d), surviving fraction (-)
9.136	1.000
9.975	0.938
10.972	0.818
12.032	0.807
12.925	0.752
13.379	0.644
13.830	0.501
15.147	0.294
15.870	0.150
16.892	0.000];
units.tS120   = {'d', '-'};  label.tS120 = {'time since birth', 'surviving fraction', '20 C'};  
temp.tS120    = C2K(20);  units.temp.tS120 = 'K'; label.temp.tS120 = 'temperature';
bibkey.tS120 = 'BeniTifn2002';
comment.tS120 = '625e3 cells Chlorella sorokiniana/ml';
% 18 C
data.tS118 = [ ... % time since birth (d), surviving fraction (-)
8.238	1.000
8.913	0.938
13.920	0.935
14.975	0.864
16.989	0.859
17.936	0.800
18.947	0.515
19.915	0.369
20.942	0.293
21.922	0.293
23.014	0.000];
units.tS118   = {'d', '-'};  label.tS118 = {'time since birth', 'surviving fraction', '18 C'};  
temp.tS118    = C2K(18);  units.temp.tS118 = 'K'; label.temp.tS118 = 'temperature';
bibkey.tS118 = 'BeniTifn2002';
comment.tS118 = '625e3 cells Chlorella sorokiniana/ml';
% 15 C
data.tS115 = [ ... % time since birth (d), surviving fraction (-)
12.021	1.000
12.944	0.640
14.004	0.636
15.968	0.363
16.975	0.363
17.991	0.135
20.004	0.133
20.891	0.000];
units.tS115   = {'d', '-'};  label.tS115 = {'time since birth', 'surviving fraction', '15 C'};  
temp.tS115    = C2K(15);  units.temp.tS115 = 'K'; label.temp.tS115 = 'temperature';
bibkey.tS115 = 'BeniTifn2002';
comment.tS115 = '625e3 cells Chlorella sorokiniana/ml';

% food-ultimate length
data.XLi = [ ... % food density (cells Chlorella sorokiniana/ml), ultimate length (cm)
625e3 0.17
62500 0.13
31250 0.12
15625 0.10
 6250 0.087
  625 0.07
 6.25 0.05];
units.XLi   = {'#/ml', 'cm'};  label.XLi = {'cell density', 'ultimate length'};  
bibkey.XLi = 'BeniTifn2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tS115 = 0 * weights.tS115;
weights.tL115 = 0 * weights.tL115;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 7 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2','tL3','tL4','tL5','tL6','tL7'}; subtitle1 = {'Data at 6.2e5, 6.2e4, 3.1e4, 1.5e4, 6.2e3, 6.2e2, 6 cells/ml'};
set2 = {'tL130', 'tL120','tL118','tL115'}; subtitle2 = {'Data at 30, 20, 18, 15 C'};
set3 = {'tS130','tS1','tS120','tS118','tS115'}; subtitle3 = {'Data at 30, 25, 20, 18, 15 C'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'The poor survival and growth at 15 C is not captured well, which was the reason to give it weight zero';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'parthenogenetic reproduction, continuous moulting; cladocerans reach maturity in 3-8 moults';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Chlorella sorokiniana had an average diameter of 3 mum, and a biovolume of 14 mum^3 and wet weight per cell was estimated at 14e-6 mug (but pi/6*3e-12 = 1.57e-12)';
metaData.bibkey.F2 = 'BeniTifn2002';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '73MF2'; % Cat of Life
metaData.links.id_ITIS = '84165'; % ITIS
metaData.links.id_EoL = '1020228'; % Ency of Life
metaData.links.id_Wiki = 'Moina'; % Wikipedia
metaData.links.id_ADW = 'Moina_macrocopa'; % ADW
metaData.links.id_Taxo = '156186'; % Taxonomicon
metaData.links.id_WoRMS = '1303079'; % WoRMS


%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nina.no/archive/nina/PppBasePdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Ceriodaphnia~pulchella.pdf}}';
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
bibkey = 'BeniTifn2002'; type = 'Article'; bib = [ ... 
'author = {A. Benider and A. Tifnouti and R. Pourriot}, ' ... 
'year = {2002}, ' ...
'title = {Growth of \emph{Moina macrocopa} ({S}traus 1820) ({C}rustacea, {C}ladocera): influence of trophic conditions, population density and temperature}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {468}, ' ...
'pages = {1--11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MartGuti1991'; type = 'Article'; bib = [ ... 
'author = {F. Martinez-Jeronimo and A. Gutierrez-Valdivia}, ' ... 
'year = {1991}, ' ...
'title = {Fecundity, reproduction, and growth of \emph{Moina macrocopa} fed different algae}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {222}, ' ...
'pages = {49--55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
