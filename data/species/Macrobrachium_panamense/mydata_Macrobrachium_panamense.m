function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_panamense
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_panamense'; 
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
data.am = 4.6*365;  units.am = 'd';     label.am = 'life span';     bibkey.am = 'IbarWehr2020';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp  = 5; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Palaemon elegans 3.65*8/5.84 cm';
data.Li  = 8;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'IbarWehr2020';
  comment.Li = 'based on LW data';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm for Palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 10.54;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 43.2*(5/8)^3 g';
data.Wwi = 43.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'IbarWehr2020';
  comment.Wwi = 'based on LW data'; 

data.Ri  = 5.15e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative max reprod rate, compared to Palaemon elegans: 43.2/1.43*1704 per yr';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), carapace length (cm), weight (g)
0.343	1.566  0.267
0.439	2.169  0.667
0.632	2.909  2.506
0.806	3.460  4.679
0.999	4.182  7.689
1.290	4.854 12.207
1.522	5.439 16.389
2.279	6.747 31.278];
data.tLW(:,1) = data.tLW(:,1)*365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'carapace length', 'weight'};  
temp.tLW    = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'IbarWehr2020'; treat.tLW = {1, {'length','weight'}};
    
% length-weight
data.LW = [ ... % carapace length (cm), weight (g)
1.039	0.127
1.324	0.254
1.422	0.508
1.488	1.017
1.554	0.508
1.652	0.508
1.696	0.381
1.816	0.890
1.937	1.271
2.068	1.271
2.243	2.034
2.276	1.398
2.341	0.636
2.462	0.763
2.495	2.415
2.582	0.763
2.681	4.195
2.692	1.653
2.758	2.288
2.834	2.924
2.856	1.653
2.966	3.686
2.976	2.669
2.977	3.051
3.053	3.941
3.064	2.161
3.107	1.271
3.130	3.432
3.250	2.797
3.272	2.161
3.272	3.941
3.392	2.542
3.414	3.814
3.414	4.449
3.502	5.339
3.513	2.797
3.557	3.814
3.579	5.212
3.656	7.119
3.710	4.449
3.732	5.720
3.764	2.924
3.808	4.068
3.907	4.703
3.940	5.975
4.017	8.390
4.038	5.720
4.049	4.322
4.104	6.992
4.126	4.958
4.191	4.958
4.214	8.263
4.246	5.720
4.247	9.534
4.257	3.686
4.268	7.119
4.312	6.610
4.356	9.280
4.367	8.263
4.422	9.915
4.432	7.119
4.433	11.314
4.433	11.822
4.455	8.898
4.531	6.610
4.542	10.805
4.575	7.881
4.674	14.364
4.718	13.729
4.739	10.042
4.751	11.949
4.783	9.025
4.805	12.712
4.849	9.661
4.849	11.059
4.859	8.517
4.914	8.898
4.991	11.949
5.079	11.059
5.112	15.636
5.244	17.924
5.265	12.966
5.320	15.254
5.406	8.644
5.463	18.432
5.506	13.729
5.506	16.780
5.527	11.568
5.540	19.703
5.561	17.669
5.627	18.941
5.637	14.746
5.671	20.212
5.682	17.924
5.682	21.229
5.713	10.169
5.714	13.983
5.879	19.703
5.880	25.169
5.911	17.161
5.944	19.195
6.065	18.686
6.088	27.966
6.100	29.619
6.175	26.059
6.241	23.644
6.242	29.492
6.252	28.220
6.297	32.034
6.428	30.127
6.581	28.983
6.658	31.271
6.670	36.610
6.987	34.449
7.053	41.059
7.194	32.415
7.207	43.729
7.524	43.347
7.995	43.220];
units.LW   = {'cm', 'g'};  label.LW = {'carapace length', 'weight'};  
bibkey.LW = 'IbarWehr2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Disccussion points
% D1 = '';
% metaData.discussion = struct('D1',D1);  

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9GQCZ'; % Cat of Life
metaData.links.id_ITIS = '1192248'; % ITIS
metaData.links.id_EoL = '318655'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_panamense'; % ADW
metaData.links.id_Taxo = '858813'; % Taxonomicon
metaData.links.id_WoRMS = '587427'; % WoRMS

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

