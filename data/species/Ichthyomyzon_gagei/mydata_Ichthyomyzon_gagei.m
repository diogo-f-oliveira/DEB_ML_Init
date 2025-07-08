function [data, auxData, metaData, txtData, weights] = mydata_Ichthyomyzon_gagei

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Ichthyomyzon_gagei'; 
metaData.species_en = 'Southern brook lamprey'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 08 08];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 08 08]; 

%% set data
% zero-variate data;
data.ab = 17;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishesoftexas';   
  temp.ab = C2K(14); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3.5*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Beam1982';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishesoftexas';
data.Li  = 17;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'msstate';
  comment.Wwb = 'based on egg diameter of 0.92 mm: pi/6*0.092^3';
data.Wwp = 0.57;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwp = 'based on 0.00105*Lp^3.03';
data.Wwi = 5.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00105*Li^3.03, see F1)';

data.NR  = 2485;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'Walk2007';   
  temp.NR = C2K(14); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
 9*30.5  3.985	
12*30.5  4.482	
13*30.5  4.610	
14*30.5  5.307
16*30.5  6.048	
20*30.5  6.503	
21*30.5  7.248	
23*30.5  7.825	
24*30.5  8.283];
data.tL(:,1) = -30+ + data.tL(:,1); % correct for guessed origin
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Beam1982';
comment.tL = 'Data from Choclafaula and Little Creeks';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'assumption: Ww_i excludes eggs';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, no parasitic stage';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00105*(TL in cm)^3.03';
metaData.bibkey.F2 = 'fishbase';
F3 = 'I. gagei: Ammocoetes do not have a predetermined sex; instead, they all rapidly produce eggs until about 17 months of age. Sex is determined by environmental factors including stream temperature, population density, average growth rate, and pH. Males then re-absorb the eggs, though it is not uncommon for male ammocoetes to still have eggs in their testes.';
metaData.bibkey.F3 = 'msstate';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6MTSN'; % Cat of Life
metaData.links.id_ITIS = '159727'; % ITIS
metaData.links.id_EoL = '207507'; % Ency of Life
metaData.links.id_Wiki = 'Ichthyomyzon_gagei'; % Wikipedia
metaData.links.id_ADW = 'Ichthyomyzon_gagei'; % ADW
metaData.links.id_Taxo = '177438'; % Taxonomicon
metaData.links.id_WoRMS = '1015054'; % WoRMS
metaData.links.id_fishbase = 'Ichthyomyzon-gagei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ichthyomyzon_gagei}}';  
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
bibkey = 'Beam1982'; type = 'article'; bib = [ ...  
'author = {F. Walliam H. Beamish}, ' ...
'year = {1982}, ' ...
'title  = {Biology of of the southern brook lamprey \emph{Ichthyomyzon gagei}}, ' ...
'journal = {Env. Biol. Fish}, ' ...
'volume = {7(4)}, ' ...
'page = {305-320}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Walk2007'; type = 'article'; bib = [ ...  
'author = {Gretchen E. Walker}, ' ...
'year = {2007}, ' ...
'title  = {End of life behaviour in the the maountain brook lamprey \emph{Ichthyomyzon greeleyi}}, ' ...
'journal = {American currents}, ' ...
'volume = {33(3)}, ' ...
'page = {881-890}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ichthyomyzon-gagei.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'msstate'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.cfr.msstate.edu/wildlife/fisheries/?a=detail&id=69&info=}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/ichthyomyzon gagei.htm}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  