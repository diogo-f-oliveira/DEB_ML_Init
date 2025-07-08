function [data, auxData, metaData, txtData, weights] = mydata_Anaxyrus_californicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Anaxyrus_californicus'; 
metaData.species_en = 'Arroyo toad'; 

metaData.ecoCode.climate = {'BWh', 'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTd', 'jiTa'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 26];

%% set data
% zero-variate data

data.ab = 6;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 35;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'guess';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FishBreh2018';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.4;  units.Lj  = 'mm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'guess'; 
data.Li  = 7.5;   units.Li  = 'mm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim  = 6.8;   units.Lim  = 'mm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'guess';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 176;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
 comment.Wwi = 'based on Bufo bufo: 417*(7.5/10)^3';
data.Wwim = 131;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
 comment.Wwim = 'based on Bufo bufo: 417*(6.8/10)^3';
  
data.Ri  = 4700/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
1.034	5.239
1.051	5.053
1.102	5.119
1.161	5.020
1.804	6.287
1.829	5.466
1.863	7.182
1.863	6.786
1.871	6.687
1.871	6.039
1.888	5.164
1.897	4.669
1.914	5.730
1.931	5.226
1.964	6.167
1.973	5.433
2.032	6.530
2.032	6.501
2.032	5.367
2.074	7.302
2.091	5.783
2.108	6.468
2.108	6.324
2.134	6.382
2.134	5.977
2.134	5.119
2.184	6.258
2.193	6.865
2.785	6.316
2.810	6.023
2.836	6.126
2.912	5.569
2.920	6.456
2.963	6.968
2.980	7.380
3.014	7.005
3.022	6.184
3.030	6.687
3.047	6.068
3.056	5.717
3.056	6.010
3.056	6.109
3.073	5.899
3.098	6.406
3.115	6.922
3.140	7.434
3.166	5.981
3.174	6.093
3.174	7.120
3.217	5.705
3.800	6.444
3.800	5.693
3.843	7.195
3.860	6.283
3.885	6.600
3.893	6.522
3.919	6.869
3.927	6.728
3.944	6.885
3.961	6.803
4.020	6.757
4.046	6.955
4.054	6.534
4.063	6.258
4.071	6.869
4.096	6.567
4.139	6.472
4.156	7.030
4.164	6.340
4.164	6.299
4.173	6.881
4.807	6.918
4.816	6.980
4.832	6.778
4.849	6.373
4.866	6.951
5.078	6.823
5.154	7.025
5.822	7.236
5.898	6.534];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FishBreh2018'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
1.000	6.039
1.008	4.814
1.051	4.970
1.051	5.053
1.093	5.135
1.110	4.855
1.118	4.975
1.135	5.177
1.161	4.657
1.821	5.371
1.829	5.016
1.931	5.288
1.939	5.032
1.939	6.047
1.948	6.712
1.956	5.416
1.990	4.677
1.990	5.631
1.998	6.023
2.032	5.841
2.074	5.664
2.083	5.296
2.091	4.979
2.100	5.837
2.142	4.550
2.151	5.878
2.193	5.680
2.201	6.010
2.794	5.833
2.827	6.299
2.878	5.387
2.887	5.973
2.895	5.899
2.912	6.019
2.912	4.603
2.946	6.716
2.946	5.812
2.954	6.431
2.971	5.874
2.988	5.969
3.014	6.580
3.014	5.994
3.064	5.693
3.081	6.291
3.090	5.503
3.107	5.140
3.115	5.268
3.124	6.518
3.149	6.208
3.149	5.870
3.157	6.671
3.166	6.031
3.166	5.688
3.183	4.562
3.826	5.622
3.826	5.779
3.826	5.829
3.860	6.786
3.885	5.631
3.893	6.023
3.893	6.184
3.902	6.109
3.919	5.379
3.970	6.596
3.978	6.398
3.995	5.734
4.003	5.342
4.012	6.171
4.063	5.994
4.105	5.305
4.130	5.078
4.156	5.878
4.156	6.080
4.849	5.305
4.976	6.002
5.010	5.808
5.052	6.477
5.086	5.787
5.831	6.175
6.000	6.390];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'males'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FishBreh2018'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = '';
metaData.bibkey.F1 = ''; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DK9X'; % Cat of Life
metaData.links.id_ITIS = '773514'; % ITIS
metaData.links.id_EoL = '1019250'; % Ency of Life
metaData.links.id_Wiki = 'Anaxyrus_californicus'; % Wikipedia
metaData.links.id_ADW = 'Anaxyrus_californicus'; % ADW
metaData.links.id_Taxo = '988888'; % Taxonomicon
metaData.links.id_WoRMS = '1486704'; % WoRMS
metaData.links.id_amphweb = 'Anaxyrus+californicus'; % AmphibiaWeb
metaData.links.id_AnAge = 'Anaxyrus_californicus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anaxyrus_californicus}}';
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
bibkey = 'FishBreh2018'; type = 'Article'; bib = [ ... 
'doi = {10.1002/ece3.4158}, ' ...
'author = {Robert N. Fisher and Cheryl S. Brehme and Stacie A. Hathaway and Tim E. Hovey and Manna L. Warburton and Drew C. Stokes}, ' ... 
'year = {2018}, ' ...
'title = {Longevity and population age structure of the arroyo southwestern toad (\emph{Anaxyrus californicus}) with drought implications}, ' ...
'journal = {Bulletin of the Chicago Herpetological Society}, ' ...
'volume = {53(6)}, ' ...
'pages = {131-134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?scientific_name=Anaxyrus+californicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Anaxyrus_californicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

