function [data, auxData, metaData, txtData, weights] = mydata_Eubranchipus_bundyi
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Eubranchipus_bundyi'; 
metaData.species_en = 'Knobbedlip fairy shrimp'; 

metaData.ecoCode.climate = {'C','D'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wdi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 19]; 

%% set data
% zero-variate data

data.am = 45;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Dabo1976';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.114; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Dabo1976';
data.Lp  = 0.65;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Dabo1976';
data.Li  = 1.38;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Dabo1976';
  
data.Wwb  = 2.06e-5;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'Belk1977';
  comment.Wwb = 'based on egg diameter of 0.34 mm: pi/6*0.034^3';
data.Wdi  = 0.00196;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Dabo1976';
  comment.Wdi = 'based on F1 and Li';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), length (cm),females,males
0.000	0.114 0.118
2.539	0.194 0.199
5.360	0.418 0.423
8.474	0.639 0.673
13.162	0.852 0.872
16.204	0.815 0.850
19.480	0.910 0.960
22.757	1.005 1.000
26.804	1.041 1.040
30.055	1.048 1.062
34.285	1.033 1.029
37.659	1.124 1.106
41.889	1.109 1.091
45.235	1.105 NaN];
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'length'};  
units.temp.tL_fm = {'d','C'}; label.temp.tL_fm = 'temperature'; 
bibkey.tL_fm = 'Dabo1976'; treat.tL_fm = {1 {'females','males'}};
label.treat.tL_fm = 'gender'; comment.tL_fm = 'temps are daily means between min and max';
temp.tL_fm = [ ... % time since 9 April, min, max 
    0   0.0  6.6
    1   3.5 11.5
    2   5.5 15.4
    3   8.0 15.0
    4   8.7 16.4
    5   4.5 14.6
    6   5.6 12.2
    7   5.5 15.5
    8   9.5 19.0
    9   9.2 12.9
   10   6.5 10.9
   11   2.4  9.8
   12   4.2 13.0
   13   8.0 12.0
   14   7.6 15.0
   15   5.0 10.5
   16   0.0  5.0
   17   0.0  4.5
   18   2.6 13.2
   19   6.8 15.6
   20   8.5 13.6
   21   9.0 15.3
   22  10.4 17.0
   23  11.5 16.4
   24  11.5 14.8
   25   9.8 16.4
   26   9.4 13.5
   27   6.8 13.5
   28   6.2 17.0
   29   9.7 17.8
   30  10.8 18.8
   31  11.2 19.4
   32  11.2 20.2
   33  13.5 21.8
   34  14.9 21.8
   35  11.5 13.0
   36   8.2 14.6
   37   8.5 17.5
   38  10.5 18.2
   39  10.2 15.4
   40   9.4 15.8
   41   8.3 18.8
   42  10.1 18.9
   44  13.7 20.6
   45  13.3 24.0]; 
temp.tL_fm = [temp.tL_fm(:,1), sum(temp.tL_fm(:,2:3),2)/2];

% length-fecundity
data.LN = [ ... % temperature (C), time since birth at puberty (d), life span (d)
0.797	9.856
0.803	11.604
0.820	13.985
0.822	8.815
0.848	22.089
0.860	8.965
0.869	8.008
0.881	21.921
0.888	13.888
0.889	22.794
0.901	18.735
0.903	16.826
0.909	17.938
0.914	17.062
0.915	18.970
0.916	14.755
0.925	16.820
0.927	20.955
0.928	21.750
0.934	23.816
0.941	19.917
0.943	20.951
0.956	13.949
0.967	19.035
0.975	23.884
0.976	25.077
0.977	18.874
0.979	22.770
0.981	14.181
0.982	21.974
0.983	18.077
0.984	20.144
0.984	23.882
0.984	29.687
0.989	17.041
0.993	19.744
0.994	23.879
0.995	25.072
1.001	21.014
1.004	23.956
1.012	19.660
1.020	19.976
1.025	22.678
1.028	31.107
1.031	20.689
1.036	26.651
1.038	22.993
1.042	18.936
1.044	22.912
1.046	12.891
1.046	21.877
1.048	20.763
1.049	24.978
1.050	23.944
1.051	26.966
1.052	21.955
1.060	17.897
1.061	23.782
1.065	22.906
1.067	21.633
1.069	24.098
1.069	25.052
1.071	20.996
1.074	30.856
1.078	21.869
1.084	25.923
1.098	19.796
1.110	23.053
1.114	23.768
1.118	25.993
1.119	31.878
1.121	23.846
1.122	27.106
1.134	22.888
1.136	25.989
1.144	25.907
1.180	26.136
1.184	23.670
1.378	32.127];
units.LN = {'cm','#'}; label.LN = {'length','fecundity'};  
temp.LN = C2K(17); units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'Dabo1976'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm; 
weights.LN = 5 * weights.LN; 
weights.Li = 5 * weights.Li; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};
 
%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
D2 = 'Accumulation time of 15 d is assumed for LN data';   
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight dry weight Wd in mug = 3.08*(length im mm)^2.46';
metaData.bibkey.F1 = 'Dabo1976'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7TLW8'; % Cat of Life
metaData.links.id_ITIS = '83726'; % ITIS
metaData.links.id_EoL = '1020258'; % Ency of Life
metaData.links.id_Wiki = 'Eubranchipus_bundyi'; % Wikipedia
metaData.links.id_ADW = 'Eubranchipus_bundyi'; % ADW
metaData.links.id_Taxo = '376515'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dabo1976'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z76-021}, ' ...
'author = {Daborn, Graham R.}, ' ... 
'year = {1976}, ' ...
'title = {The life cycle of \emph{Eubranchipus bundyi} ({F}orbes) ({C}rustacea: {A}nostraca) in a temporary vernal pond of Alberta}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {54(2))}, ' ...
'pages = {193–201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];%
%
bibkey = 'Belk1977'; type = 'Article'; bib = [ ... 
'doi = {10.2307/3670467}, ' ...
'author = {Denton Belk}, ' ... 
'year = {1977}, ' ...
'title = {Evolution of Egg Size Strategies in Fairy Shrimps}, ' ...
'journal = {The Southwestern Naturalist}, ' ...
'volume = {22(1)}, ' ...
'pages = {99–105}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

