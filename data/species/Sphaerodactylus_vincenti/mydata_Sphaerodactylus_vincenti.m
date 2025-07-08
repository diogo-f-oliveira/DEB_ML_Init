function [data, auxData, metaData, txtData, weights] = mydata_Sphaerodactylus_vincenti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Sphaerodactylidae';
metaData.species    = 'Sphaerodactylus_vincenti'; 
metaData.species_en = 'Vincent''s least gecko'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 63.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'LeclLecl2011';   
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '60 to 67 d (depending on humidity';
data.tp = 19*30.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'LeclLecl2011';   
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'LeclLecl2011';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.4;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'LeclLecl2011';  
data.Lp  = 2.55;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'LeclLecl2011';  
data.Li  = 3.;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'LeclLecl2011';  
data.Lim  = 2.9;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'LeclLecl2011';  

data.Wwi = 0.58;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'SteiPowe2007';
data.Wwim = 0.66;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'SteiPowe2007';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'SteiPowe2007';   
  temp.Ri = C2K(26);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch each 1 yr';

% univariate data
% time -  length data
data.tL_f = [ ... % age (d),  SVL (cm)
4.678	1.503
4.678	1.457
4.678	1.346
91.219	1.615
362.538	2.399
369.555	2.251
369.555	1.997
551.994	2.653
729.755	2.898
732.094	2.557
732.094	2.496
734.433	2.750
825.652	2.756
825.652	2.553
827.991	2.959
916.871	2.954
1005.751	2.904
1096.971	3.057
1099.310	3.001
1099.310	2.940
1099.310	2.894
1188.190	2.813
1188.190	3.016];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LeclLecl2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (d),  SVL (cm)
369.555	2.058
463.114	2.506
547.316	2.501
549.655	2.384
640.874	2.648
732.094	2.446
734.433	2.710
734.434	2.649
734.435	2.608
827.991	2.608
827.992	2.690
916.871	2.766
916.872	2.665
916.873	2.568
921.549	2.812
1092.293	2.813
1094.632	2.762
1190.529	2.904
1281.748	3.006
1281.749	2.915
1464.187	2.905
1466.526	3.002];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LeclLecl2011';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6Z8D5'; % Cat of Life
metaData.links.id_ITIS = '819295'; % ITIS
metaData.links.id_EoL = '790589'; % Ency of Life
metaData.links.id_Wiki = 'Sphaerodactylus_vincenti'; % Wikipedia
metaData.links.id_ADW = 'Sphaerodactylus_vincenti'; % ADW
metaData.links.id_Taxo = '641973'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sphaerodactylus&species=vincenti'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphaerodactylus_vincenti}}';
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
bibkey = 'LeclLecl2011'; type = 'Article'; bib = [ ... 
'author = {Raymond Leclair and Maria Helena Leclair}, ' ... 
'year = {2011}, ' ...
'title = {Life-History Traits in a Population of the Dwarf Gecko, \emph{Sphaerodactylus vincenti ronaldi}, from a Xerophytic Habitat in {M}artinique, {W}est {I}ndies}, ' ...
'pages = {566-576}, ' ...
'volume = {2011(4)}, ' ...
'journal = {Copeia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SteiPowe2007'; type = 'Article'; bib = [ ... 
'author = {David S. Steinberg and Sylvia D. Powell and Robert Powell and John S. Parmerlee and Robert W. Henderson}, ' ... 
'year = {2007}, ' ...
'title = {Population Densities, Water-Loss Rates, and Diets of \emph{Sphaerodactylus vincenti} on {S}t. {V}incent, {W}est {I}ndies}, ' ...
'pages = {330-336}, ' ...
'volume = {41}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
