function [data, auxData, metaData, txtData, weights] = mydata_Benthosema_fibulatum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Benthosema_fibulatum'; 
metaData.species_en = 'Spinycheek lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MI', 'MP'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 31];

%% set data
% zero-variate data
data.am = 1.5*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Gjos1978';  
  temp.am = C2K(8.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 10;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 0.65; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00871*Lp^3.11, see F1';
data.Wwi = 11.22; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00871*Li^3.11, see F1';
  
data.Ri = 10.6; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(8.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';

% uni-variate data
% tL data
data.tL = [ ... % time since metam (d), standard length (cm) 
55.374	2.860
59.961	3.035
60.616	3.439
74.050	3.867
80.275	4.154
89.450	4.812
130.079	6.646
168.742	5.945
179.882	5.809
228.702	8.172
237.549	7.181
248.689	6.884];
units.tL = {'d', 'cm'}; label.tL = {'time since metam', 'standard length'};  
temp.tL = C2K(8.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gjos1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;
weights.Ri = 0*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(SL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LHZJ'; % Cat of Life
metaData.links.id_ITIS = '623747'; % ITIS
metaData.links.id_EoL = '46564031'; % Ency of Life
metaData.links.id_Wiki = 'Benthosema_fibulatum'; % Wikipedia
metaData.links.id_ADW = 'Benthosema_fibulatum'; % ADW
metaData.links.id_Taxo = '164098'; % Taxonomicon
metaData.links.id_WoRMS = '217681'; % WoRMS
metaData.links.id_fishbase = 'Benthosema-fibulatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Benthosema_fibulatum}}';
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
bibkey = 'Gjos1978'; type = 'techreprot'; bib = [ ...
'author = {Jakob Gj\"{o}s{\ae}ter}, ' ... 
'year   = {1978}, ' ...
'title  = {Aspects of the distribution and ecology of the Myctophidae from the western and northern {A}rabian {S}ea}, ' ...
'journal = {Report of the FAO/Norway workshop on the fishery resources in the north Arabian Sea. Karachi, Pakistan, 16-28 January 1978}, ' ...
'number = {IOFC/DEV/78/43}, ' ...
'pages = {62-108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Benthosema-fibulatum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

