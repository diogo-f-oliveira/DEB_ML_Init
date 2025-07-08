function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_digueti

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_digueti'; 
metaData.species_en = 'River prawn'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp % mean ambient reservoir water temperature in  EtimSank1998
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 02];

%% set data
% zero-variate data

data.am = 7.7*365;  units.am = 'd';     label.am = 'life span';     bibkey.am = 'IbarWehr2020';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp  = 2.5; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Palaemon elegans 3.65*4/5.84 cm';
data.Li  = 4;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'IbarWehr2020';
  comment.Li = 'based on LW data';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm for Palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 5.62;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 340*(6/9.6)^3 g';
data.Wwi = 23;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'IbarWehr2020';
  comment.Wwi = 'based on LW data'; 

data.Ri  = 2.74e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative max reprod rate, compared to Palaemon elegans: 23/1.43*1704 per yr';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), carapace length (cm), weight (g)
0.605	1.179  6.085
0.653	1.353  7.600
0.889	1.661 12.145
1.102	1.970 18.205
1.597	2.385 34.084
2.398	3.029 69.601];
data.tLW(:,1) = data.tLW(:,1)*365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'carapace length', 'weight'};  
temp.tLW    = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'IbarWehr2020'; treat.tLW = {1, {'length','weight'}};
    
% length-weight
data.LW = [ ... % carapace length (cm), weight (g)
0.774	0.020
0.818	0.148
0.849	0.213
0.905	0.151
0.936	0.151
0.948	0.088
0.991	0.153
1.010	0.153
1.029	0.409
1.066	0.155
1.090	0.155
1.103	0.793
1.146	0.412
1.171	0.157
1.196	0.477
1.208	0.222
1.233	0.478
1.245	0.478
1.276	0.862
1.326	0.225
1.351	0.736
1.369	0.226
1.400	0.801
1.450	0.356
1.475	0.930
1.487	0.612
1.524	0.932
1.537	0.677
1.568	0.678
1.586	0.104
1.623	1.189
1.648	0.999
1.685	1.574
1.698	0.617
1.704	1.128
1.735	1.447
1.772	2.022
1.791	0.747
1.797	1.513
1.828	1.513
1.840	0.621
1.846	1.897
1.884	0.941
1.914	1.261
1.921	1.771
1.958	2.537
1.970	1.262
1.976	1.007
1.995	2.219
2.020	3.049
2.026	1.519
2.045	2.412
2.069	2.157
2.107	1.584
2.107	2.669
2.125	2.478
2.162	2.925
2.169	2.096
2.181	1.841
2.187	3.117
2.224	2.353
2.230	4.330
2.230	1.715
2.237	3.565
2.261	2.609
2.305	3.184
2.305	3.822
2.317	2.419
2.330	3.886
2.354	3.313
2.354	2.547
2.379	4.270
2.410	3.314
2.416	4.016
2.435	2.868
2.485	4.145
2.485	3.380
2.491	6.122
2.528	3.508
2.534	5.294
2.534	4.848
2.584	3.637
2.590	4.275
2.590	3.064
2.596	4.977
2.633	3.894
2.652	3.448
2.652	4.404
2.664	6.509
2.689	4.214
2.720	3.003
2.732	4.980
2.757	4.343
2.770	5.555
2.794	7.023
2.800	6.130
2.807	4.855
2.813	6.641
2.813	4.281
2.831	8.746
2.850	8.364
2.850	6.897
2.850	5.302
2.887	4.984
2.918	5.559
2.937	8.302
2.943	7.728
2.949	5.050
2.980	6.581
2.993	8.431
3.005	5.115
3.011	5.753
3.017	4.733
3.030	7.539
3.061	7.986
3.079	7.540
3.098	5.691
3.098	8.561
3.135	10.794
3.154	6.330
3.178	7.033
3.203	9.457
3.203	6.651
3.222	10.414
3.278	10.160
3.284	8.311
3.290	11.691
3.321	9.141
3.321	7.164
3.383	10.290
3.439	9.016
3.507	12.908
3.798	14.574
3.897	16.872
4.009	22.934];
units.LW   = {'cm', 'g'};  label.LW = {'carapace length', 'weight'};  
bibkey.LW = 'IbarWehr2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 0 * weights.Li;
weights.Ri = 3 * weights.Ri;
%weights.Wwp = 3 * weights.Wwp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Disccussion points
D1 = 'The combination tL and tW data is inconsistent with LW data';
metaData.discussion = struct('D1',D1);  

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9GQ7G'; % Cat of Life
metaData.links.id_ITIS = '612665'; % ITIS
metaData.links.id_EoL = '311331'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_digueti'; % ADW
metaData.links.id_Taxo = '858740'; % Taxonomicon
metaData.links.id_WoRMS = '587192'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrobrachium}}';
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
bibkey = 'IbarWehr2020'; type = 'Article'; bib = [ ...
'doi = {10.1093/jcbiol/ruz089}, ' ...
'author = {Mauricio A. Ibarra and Ingo S. Wehrtmann}, ' ...
'year = {2020}, ' ...
'title = {Estimates of growth and longevity of six species of freshwater shrimps (\emph{Macrobrachium} spp.) ({D}ecapoda: {C}aridea: {P}alaemonidae) from {C}osta {R}ica}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {40(1)}, ' ...
'pages = {45–57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

