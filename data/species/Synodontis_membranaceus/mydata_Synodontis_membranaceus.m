  function [data, auxData, metaData, txtData, weights] = mydata_Synodontis_membranaceus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Mochokidae';
metaData.species    = 'Synodontis_membranaceus'; 
metaData.species_en = 'Catfish'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 21];

%% set data
% zero-variate data
data.ab = 9; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'bsed on Synodontis_clarias';

data.Lp = 25;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase';
data.Li = 46;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm of Synodontis_clarias: pi/6*0.1^3';
data.Wwp = 49.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 309;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'base on 0.01479*Li^2.92, see F1';

data.Ri = 4.2e4/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Synodontis_clarias: 20347*(46/36)^3';
  
% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
0.581	13.154
30.118	14.985
59.529	13.972
90.811	15.518
121.679	17.633
152.936	18.610
182.881	19.730
213.209	19.570
244.554	22.537];
data.tL(:,1) = 300 + data.tL(:,1); % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'OforVand2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^2.92'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53XPN'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '213657'; % Ency of Life
metaData.links.id_Wiki = 'Synodontis_membranaceus'; % Wikipedia
metaData.links.id_ADW = 'Synodontis_membranaceus'; % ADW
metaData.links.id_Taxo = '188669'; % Taxonomicon
metaData.links.id_WoRMS = '1019481'; % WoRMS
metaData.links.id_fishbase = 'Synodontis-membranaceus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Synodontis_membranaceus}}';  
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
bibkey = 'OforVand2001'; type = 'Article'; bib = [ ...
'doi = {10.1046/j.1365-2400.2001.00214.x}, ' ...
'author = {Ofori-Danson, P. K. and Vanderpuye, C. J. and de Graaf, G. J.}, ' ...
'year = {2001}, ' ...
'title = {Growth and mortality of the catfish, \emph{Hemisynodontis membranaceus} ({G}eoffroy {S}t. {H}ilaire), in the northern arm of {L}ake {V}olta, {G}hana}, ' ... 
'journal = {Fisheries Management and Ecology}, ' ...
'volume = {8(1)}, '...
'pages = {37–45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Synodontis-membranaceus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

