function [data, auxData, metaData, txtData, weights] = mydata_Raja_asterias

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_asterias'; 
metaData.species_en = 'Mediterranean starry ray '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 28];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 26];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data;
data.ab = 150;units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(14.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'SereBaro2005';   
  temp.am = C2K(14.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10.6; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SereBaro2005';
data.Lp  = 54; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SereBaro2005';
data.Lpm = 50;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'SereBaro2005';
data.Li  = 75;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 3.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00251*Li^3.25, see F1; max published weight 2.5 kg';

data.Ri  = 20/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(14.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on other Raja species';
  
% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.025	10.672
0.082	10.985
0.152	13.180
0.172	9.727
0.189	12.656
0.234	10.667
0.292	13.700
0.296	14.327
0.345	13.698
0.411	15.475
0.415	19.137
0.480	26.460
0.485	16.206
0.534	21.959
0.575	18.819
0.575	16.831
0.583	20.075
0.653	19.654
0.698	25.931
0.793	22.685
0.801	26.138
0.875	29.275
0.990	29.899
1.031	28.538
1.129	34.395
1.166	31.046
1.220	30.731
1.298	39.622
1.322	32.507
1.326	30.832
1.331	36.587
1.339	34.180
1.339	39.307
1.491	32.607
1.532	41.081
1.532	42.337
1.536	38.988
1.634	38.044
1.700	36.787
1.782	44.527
1.786	39.819
1.864	40.863
2.000	46.301
2.033	44.207
2.037	50.903
2.037	42.010
2.115	41.798
2.292	47.549
2.415	50.057
2.423	43.778
2.427	52.254
2.534	45.554
2.534	48.065
2.538	44.508
2.538	46.496
2.542	53.506
2.546	42.833
2.546	50.681
2.616	44.192
2.690	50.154
2.702	43.771
2.784	55.279
2.789	46.071
2.862	48.789
2.986	53.076
3.031	49.727
3.109	47.632
3.417	53.379
3.425	55.053
3.425	57.041
3.425	60.703
3.429	59.238
3.433	51.809
3.487	52.435
3.548	60.176
3.561	56.095
3.626	52.536
3.692	52.953
3.799	53.369
3.881	53.994
4.021	54.200
4.111	54.511];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
n=size(data.tL,1); for i=2:n; if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3; end; end
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(14.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SereBaro2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'mod_1: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00251*(TL in cm)^3.25';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '78RMQ'; % Cat of Life
metaData.links.id_ITIS = '160879'; % ITIS
metaData.links.id_EoL = '46560546'; % Ency of Life
metaData.links.id_Wiki = 'Raja_asterias'; % Wikipedia
metaData.links.id_ADW = 'Raja_asterias'; % ADW
metaData.links.id_Taxo = '101382'; % Taxonomicon
metaData.links.id_WoRMS = '105881'; % WoRMS
metaData.links.id_fishbase = 'Raja-asterias'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Raja_asterias}}'; 
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
bibkey = 'SereBaro2005'; type = 'techreport'; bib = [ ...  
'author = {F. Serena and M. Barone and C. Mancusi and A. J. Abella}, ' ...
'year = {2005}, ' ...
'title  = {Reproductive biology, growth and feeding habts of \emph{Raja asterias} {D}elaroche, 1809, from the north {T}yrrhenian and south {L}igurian {S}ea ({I}taly), with some notes on trends in landings}, ' ...
'institution = {International Council for the Exploration of the Sea}, ' ...
'volume = {CM 2005/ N:12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Raja-asterias.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  