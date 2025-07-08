function [data, auxData, metaData, txtData, weights] = mydata_Chiromantis_petersii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Rhacophoridae';
metaData.species    = 'Chiromantis_petersii'; 
metaData.species_en = 'Peters'' foam-nest tree frog'; 

metaData.ecoCode.climate = {'Aw','Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiTi'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 31];

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'Coe1974';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 157;     units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'Coe1974';   
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 1.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                      bibkey.am = 'guess';   
  temp.am = C2K(10.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Hyla arborea';

data.Lb  = 0.7;  units.Lb  = 'cm';  label.Lb  = 'TL at birth';                 bibkey.Lb  = 'Coe1974';
data.Lp  = 5.5;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';               bibkey.Lp  = 'LiaoLu2011';
data.Li  = 6.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';                 bibkey.Li  = 'Wiki';
data.Lim  = 4.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';              bibkey.Lim = 'Wiki';

data.Wwb = 5.23e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Coe1974';
  comment.Wwb = 'based on egg diameter 1 mm: pi/6*0.1^3';
data.Wwi = 5.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Coe1974';
data.Wwim = 4.75;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';       bibkey.Wwim = 'Coe1974';

data.Ri  = 325/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'Coe1974';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '300-350 eggs per clutch, 1 clutch per season';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm) of tadpoles
6.97	0.870
6.97	1.050
6.97	1.140
11.68	1.079
11.68	1.309
11.68	1.439
11.68	1.519
17.62	1.569
17.62	1.699
17.62	1.779
17.62	1.909
17.62	2.079
17.62	2.169
17.62	2.289
22.85	2.108
22.85	2.388
22.85	2.508
22.85	2.628
23.3	1.778
23.3	2.778
87.8	4.084
87.8	2.634
87.8	2.824
87.8	3.124
103.7	3.803
103.7	4.233
103.7	4.613
146.9	3.230
147.2	4.190]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Coe1974'; treat.tL = {1,{'females','males'}}; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'the shape of the tadpole seems to vary with size';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Makes foam nest in tree above water';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69STN'; % Cat of Life
metaData.links.id_ITIS = '665494'; % ITIS
metaData.links.id_EoL = '331292'; % Ency of Life
metaData.links.id_Wiki = 'Chiromantis_petersii'; % Wikipedia
metaData.links.id_ADW = 'Chiromantis_petersii'; % ADW
metaData.links.id_Taxo = '146080'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Chiromantis+petersii'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chiromantis_petersii}}';
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
bibkey = 'Coe1974'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1974.tb04091.x}, ' ...
'author = {Malcolm Coe}, ' ... 
'year = {1974}, ' ...
'title = {Observations on the ecology and breeding biology of the genus \emph{Chiromantis} ({A}mphibia: {R}hacophoridae)}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {172(1)}, ' ...
'pages = {13–34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Chiromantis+petersii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
