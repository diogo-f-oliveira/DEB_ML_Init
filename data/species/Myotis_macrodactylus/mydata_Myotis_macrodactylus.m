function [data, auxData, metaData, txtData, weights] = mydata_Myotis_macrodactylus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Myotis_macrodactylus'; 
metaData.species_en = 'Eastern long-fingered bat'; 

metaData.ecoCode.climate = {'Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 23]; 

%% set data
% zero-variate data

data.tg = 60;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'LiuJin2009';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.842; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'LiuJin2009';
data.Wwi = 9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'LiuJin2009';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.847	2.842
0.913	3.002
0.976	3.975
0.977	3.786
0.978	3.452
0.979	3.351
0.980	3.263
0.981	3.133
1.043	3.554
2.934	4.556
2.935	4.266
2.936	4.121
2.937	4.034
2.938	3.917
2.939	3.801
3.064	3.613
5.020	5.312
5.021	4.688
5.022	4.629
5.023	4.557
5.024	4.455
5.085	4.891
6.780	5.980
6.845	5.399
6.910	5.777
6.911	5.675
6.975	5.545
7.106	5.327
8.996	6.460
9.061	7.041
9.062	6.823
9.063	6.591
9.064	6.329
9.065	5.995
9.126	6.126
10.952	7.099
10.953	6.954
10.954	6.765
11.017	6.664
11.018	6.562
12.907	7.405
12.908	7.289
12.973	7.144
12.974	7.085
12.975	6.926
12.976	6.824
15.058	7.347
15.059	7.231
15.060	7.115
15.061	6.984
16.884	7.551
16.885	7.435
17.014	7.290
17.015	7.130
19.035	7.726
19.036	7.610
19.037	7.450
19.038	7.349
22.034	8.061
22.035	7.872
22.036	7.756
22.099	7.945
25.033	7.989
25.034	7.829
25.098	8.149
27.966	8.034
27.967	7.961
28.096	8.397
28.097	8.222
28.098	8.121
31.943	8.093
32.008	7.890
32.138	7.730
34.876	8.137
34.877	8.021
34.941	8.486
34.942	8.239
35.007	7.876
38.853	8.153
38.918	8.632
38.919	8.806
38.983	8.269
38.984	8.458
39.048	8.037
41.982	9.199
42.047	8.633
42.048	7.994
42.112	8.981
42.177	8.735
44.980	8.910
44.981	8.576
45.046	9.737
45.047	9.534
45.048	9.026
45.049	8.735
45.050	8.329
45.051	8.009];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LiuJin2009';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'scaled function response during lactation is assumed to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '8LZXW'; % Cat of Life
metaData.links.id_ITIS = '632028'; % ITIS
metaData.links.id_EoL = '327596'; % Ency of Life
metaData.links.id_Wiki = 'Myotis_macrodactylus'; % Wikipedia
metaData.links.id_ADW = 'Myotis_macrodactylus'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802466'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myotis_macrodactylus}}';
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
bibkey = 'LiuJin2009'; type = 'Article'; bib = [ ... 
'doi = {10.3161/150811009X465721}, ' ...
'author = {Liu, Ying and Jin, Long-Ru and Metzner, Walter and Feng, Jiangu}, ' ... 
'year = {2009}, ' ...
'title = {Postnatal Growth and Age Estimation in Big-Footed Myotis, \emph{Myotis macrodactylus}}, ' ...
'journal = {Acta Chiropterologica}, ' ...
'volume = {11(1)}, ' ...
'pages = {105-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

