function [data, auxData, metaData, txtData, weights] = mydata_Tadarida_brasiliensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Molossidae';
metaData.species    = 'Tadarida_brasiliensis'; 
metaData.species_en = 'Mexican free-tailed bat';

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 29]; 

%% set data
% zero-variate data

data.tg = 78;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'ADW';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4 till 7 weeks';
data.tp = 273;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 547;    units.tpm = 'd';    label.tpm = 'time since birth at first litter male';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'AnAge';
data.Wwi = 12.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litters per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
0.898	3.934
0.939	3.416
0.945	3.589
0.949	3.685
0.951	3.761
0.969	4.279
0.975	2.745
0.977	4.509
0.981	2.898
0.983	2.975
0.989	3.128
0.993	3.263
1.912	2.378
3.036	4.024
4.863	5.380
4.897	4.652
4.907	4.958
4.910	5.035
4.914	5.150
4.917	5.227
4.959	4.747
4.961	4.805
5.067	4.421
6.007	5.875
6.164	5.281
6.169	5.415
7.017	5.930
7.020	6.026
7.071	4.071
7.104	5.029
7.956	5.659
7.972	6.119
7.977	6.254
8.016	3.953
8.018	5.736
8.113	6.752
9.853	7.322
9.889	6.670
10.138	6.995
10.921	7.357
10.925	7.472
10.928	7.549
10.993	7.702
11.012	6.552
12.030	8.543
12.033	8.620
12.104	7.239
17.029	9.028
18.055	9.543
18.930	9.100
18.936	9.291
18.952	9.751
18.966	10.154
20.066	9.365
20.082	9.825
20.094	10.170
20.964	11.318
20.970	9.784
21.065	10.819
22.919	11.274
22.922	11.351
23.004	10.277
23.006	10.354
23.009	10.430
23.034	9.434
23.042	9.683
23.966	10.677
23.978	11.022
24.935	11.250
25.018	11.939
25.064	9.831
25.091	8.891
26.028	8.563
26.134	9.885
26.897	11.378
26.990	8.925
27.008	9.442
27.872	10.417
28.078	11.241
28.097	10.053
29.004	10.568
29.974	11.179
30.012	10.565
30.050	9.951
31.027	10.754
31.054	9.815
31.056	11.597
31.160	11.156
31.965	12.151
32.011	10.061
32.910	10.308
32.934	11.017
35.801	13.310
35.973	9.706
36.008	10.702
37.986	9.585
38.063	10.122
38.067	10.217
38.918	10.809
39.975	8.813
40.100	10.691
40.111	11.017
40.934	9.079
40.942	9.309
41.025	10.018
41.839	9.536
42.094	11.759
42.097	10.130
43.182	8.919
47.089	12.129];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KunzRobs1995';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;
weights.Wwb = 50 * weights.Wwb;
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
D2 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '54GGQ'; % Cat of Life
metaData.links.id_ITIS = '180088'; % ITIS
metaData.links.id_EoL = '327954'; % Ency of Life
metaData.links.id_Wiki = 'Tadarida_brasiliensis'; % Wikipedia
metaData.links.id_ADW = 'Tadarida_brasiliensis'; % ADW
metaData.links.id_Taxo = '65317'; % Taxonomicon
metaData.links.id_WoRMS = '1505232'; % WoRMS
metaData.links.id_MSW3 = '13801768'; % MSW3
metaData.links.id_AnAge = 'Tadarida_brasiliensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tadarida_brasiliensis}}';
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
bibkey = 'KunzRobs1995'; type = 'Article'; bib = [ ... 
'author = {T. Kunz and S. K. Robson}, ' ... 
'year = {1995}, ' ...
'title = {Postnatal growth and development in the {M}exican free-tailed bat (\emph{Tadarida brasiliensis mexicana}): birth size, growth rates, and age estimation}, ' ...
'journal = {J. Mammalogy}, ' ...
'number = {3}, ' ...
'volume = {76}, ' ...
'pages = {769--783}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tadarida_brasiliensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Tadarida_brasiliensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

