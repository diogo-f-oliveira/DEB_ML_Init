function [data, auxData, metaData, txtData, weights] = mydata_Eurycea_quadridigitata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Eurycea_quadridigitata'; 
metaData.species_en = 'Southeastern dwarf salamander'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tL_fT'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 11];

%% set data
% zero-variate data

data.ab = 100;       units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'guess';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9.1*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'guess';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Eurycea lucifuga';

data.Lb  = 0.75;       units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Seml1980';
data.Lj  = 2.3;       units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'Seml1980';
data.Lp  = 2.5;        units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'Seml1980'; 
data.Li  = 4.56;         units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';
  comment.Li = 'TL 8.9 cm, converted to SVL using F1';

data.Wwi = 2.6;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Eurycea lucifuga: 3.7*(8.9/10)^3';

data.Ri  = 30/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12-48 eggs per clutch, 1 clutch each other yr';

% univariate data
data.tL_K = [ ... % time since birth (d), SVL (cm)
0.000	0.738
32.707	0.802
71.619	1.527
91.538	1.860
124.497	2.109
150.290	2.156
186.964	2.268];
units.tL_K  = {'d', 'cm'};  label.tL_K = {'time since birth', 'SVL', 'Karen''s pond'};  
temp.tL_K   = 'varying';  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'Seml1980'; comment.tL_K = 'Data from Karen''s pond';
%
data.tL_F = [ ... % time since birth (d), SVL (cm)
0.000	0.750
32.417	1.005
71.030	1.843
93.422	2.050
126.385	2.335
151.865	2.358
187.292	2.434];
units.tL_F  = {'d', 'cm'};  label.tL_F = {'time since birth', 'SVL', 'Flamingo Bay'};  
temp.tL_F   = 'varying';  units.temp.tL_F = 'K'; label.temp.tL_F = 'temperature';
bibkey.tL_F = 'Seml1980'; comment.tL_F = 'Data from Flamingo Bay';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_F = weights.tL_F * 5;
weights.tL_K = weights.tL_K * 5;
weights.Li = weights.Li * 3;
weights.Lb = weights.Lb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_F','tL_K'}; subtitle1 = {'Data from Flamingo Bay, Karen''s Pond'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as: 15+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'SVL = TL * 0.389, based on photo';
metaData.bibkey.F1 = 'srelherp'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3D3HJ'; % Cat of Life
metaData.links.id_ITIS = '173695'; % ITIS
metaData.links.id_EoL = '1039104'; % Ency of Life
metaData.links.id_Wiki = 'Eurycea_quadridigitata'; % Wikipedia
metaData.links.id_ADW = 'Eurycea_quadridigitata'; % ADW
metaData.links.id_Taxo = '47417'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Eurycea+quadridigitata'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eurycea_quadridigitata}}';
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
bibkey = 'Seml1980'; type = 'Article'; bib = [ ... 
'author = {Raymond D. Semlitsch}, ' ... 
'year = {1980}, ' ...
'title = {Growth and Metamorphosis of Larval Dwarf Salamanders (\emph{Eurycea quadridigitata})}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {36(2)}, ' ...
'pages = {138-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Eurycea+quadridigitata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eurycea_quadridigitata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1039104/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'srelherp'; type = 'Misc'; bib = ...
'howpublished = {\url{https://srelherp.uga.edu/salamanders/pics/eurqua210.jpg}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

