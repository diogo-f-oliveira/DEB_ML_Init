function [data, auxData, metaData, txtData, weights] = mydata_Eleutherodactylus_coqui

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Eleutherodactylidae';
metaData.species    = 'Eleutherodactylus_coqui'; 
metaData.species_en = 'Common coqui'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 13]; 

%% set data
% zero-variate data

data.ab = 22;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(20.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17 to 26 d';
data.tp = 8*30.5; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(20.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(20.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ONeiBear2018';  
data.Lp  = 2.5;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'BearAlCh2008';
data.Li  = 5.2;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim = 3.5;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'Wiki';

data.Wwb = 6.54e-2; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ONeiBear2018';
  comment.Wwb = 'based on egg diameter of 5 mm: pi/6*0.5^3';
data.Wwi = 22;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected Pelobates fuscus: (5.2/6)^3*34';

data.Ri  = 30*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
temp.Ri  = C2K(20.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '16 to 40 eggs per clutch, 4 to 6 clutches per yr'; 

% uni-variate data
% time-length
data.LdL_f = [ ... % SVL (cm), change in SVL (mum/d)
2.696	11.377
2.790	17.968
2.930	8.397
2.987	10.474
3.049	24.650
3.054	18.600
3.074	17.246
3.076	2.257
3.251	16.163
3.263	25.553
3.277	12.190
3.285	8.217
3.306	18.691
3.345	12.641
3.376	0.090
3.394	20.135
3.442	7.494
3.454	8.578
3.477	8.668
3.488	6.050
3.546	17.336
3.568	0.271
3.583	19.684
3.602	6.953
3.622	1.445
3.625	4.876
3.685	3.973
3.708	0.000
3.711	2.619
3.711	4.605
3.765	6.501
3.786	9.661
3.929	8.578
3.974	6.953
3.986	2.619
4.015	9.481
4.117	2.167];
units.LdL_f   = {'cm', 'mum/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f    = C2K(20.5);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f  = 'BearAlCh2008';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (mum/d)
2.652	8.488
2.659	15.079
2.664	10.384
2.736	13.905
2.744	10.293
2.747	4.786
2.747	5.418
2.758	0.090
2.764	8.939
2.766	1.264
2.776	11.558
2.778	5.869
2.778	10.023
2.781	6.321
2.783	0.361
2.793	6.862
2.801	10.384
2.804	9.029
2.805	14.176
2.810	11.467
2.821	0.000
2.822	12.912
2.824	6.050
2.827	4.515
2.833	14.718
2.836	18.871
2.847	6.772
2.855	3.251
2.862	17.065
2.864	0.000
2.865	12.731
2.865	22.122
2.867	1.896
2.867	3.612
2.870	14.898
2.876	13.995
2.881	1.535
2.881	6.682
2.893	8.849
2.894	19.323
2.896	13.725
2.898	0.903
2.898	3.160
2.905	15.621
2.905	16.524
2.916	6.230
2.916	12.551
2.918	4.605
2.920	24.108
2.921	0.090
2.927	2.167
2.927	4.063
2.927	11.738
2.930	7.133
2.932	1.716
2.938	3.251
2.941	4.966
2.944	0.181
2.947	2.528
2.950	10.655
2.950	11.377
2.962	12.460
2.970	3.612
2.973	11.558
2.990	8.217
2.990	8.849
2.995	1.625
2.996	14.718
2.996	16.072
3.001	0.181
3.010	8.939
3.013	6.501
3.016	10.384
3.028	18.059
3.030	1.716
3.030	5.418
3.030	7.494
3.038	3.070
3.039	8.217
3.039	11.919
3.039	14.357
3.050	7.043
3.052	0.271
3.054	24.018
3.061	3.160
3.061	4.605
3.076	6.230
3.076	12.460
3.079	4.876
3.084	0.271
3.084	7.314
3.107	2.889
3.107	7.314
3.114	20.135
3.122	12.912
3.122	13.905
3.147	2.619
3.155	0.181
3.157	15.079
3.167	7.494
3.172	34.402
3.176	6.230
3.182	4.966
3.184	0.181
3.224	0.361
3.224	4.063
3.282	6.772
3.305	6.682
3.367	31.422
3.511	11.648];
units.LdL_m   = {'cm', 'mum/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m    = C2K(20.5);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m  = 'BearAlCh2008';
comment.LdL_m = 'Data for males';


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
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Direct development, eggs on land on palm leaves and in bird nests'; 
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3996F'; % Cat of Life
metaData.links.id_ITIS = '173559'; % ITIS
metaData.links.id_EoL = '330433'; % Ency of Life
metaData.links.id_Wiki = 'Eleutherodactylus_coqui'; % Wikipedia
metaData.links.id_ADW = 'Eleutherodactylus_coqui'; % ADW
metaData.links.id_Taxo = '88107'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Eleutherodactylus+coqui'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eleutherodactylus_coqui}}';
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
bibkey = 'ONeiBear2018'; type = 'Article'; bib = [ ...  
'author = {Eric M. O''Neill and Karen H. Beard and Charles W. Fox}, ' ...
'year = {2018}, ' ...
'title  = {Body Size and Life History Traits in Native and Introduced Populations of Coqui Frogs}, ' ...
'journal = {Copeia}, ' ...
'volme = {106}, ' ...
'pages = {161-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BearAlCh2008'; type = 'Article'; bib = [ ... 
'author = {Karen H. Beard and Robert Al-Chokhachy and Nathania C. Tuttle and Eric M. O''Neill}, ' ... 
'year = {2008}, ' ...
'title = {Population Density Estimates and Growth Rates of \emph{Eleutherodactylus coqui} in {H}awaii}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {42}, ' ...
'pages = {626-636}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Eleutherodactylus&where-species=coqui}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

