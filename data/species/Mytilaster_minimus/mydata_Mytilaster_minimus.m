function [data, auxData, metaData, txtData, weights] = mydata_Mytilaster_minimus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Mytilaster_minimus'; 
metaData.species_en = 'Dwarf mussel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Valeria Palmeri'; 'Valeria Montalto'; 'Alessandro Rinaldi'; 'Gianluca Sara'};   
metaData.date_subm = [2011 10 22];           
metaData.email    = {'valeriapalmeri@unipa.it'};  
metaData.address  = {'University of Palermo, Italy'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2015 12 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 27]; 


%% set data
% zero-variate data

data.ab = 1.1;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SaraBuff2004';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 182;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Rina2011';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.018; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lj  = 0.25;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'Mont2011';
data.Lp  = 0.45;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Mont2011';
data.Li  = 2.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Mont2011';

data.Wwp = 0.015; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'Mont2011';
data.Wwi = 0.50;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Mont2011';

data.Ri  = 1400;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Mont2011';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 100 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Facts
F1 = 'This entry is discussed in Palm2012';
metaData.bibkey.F1 = {'Palm2012'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45GCS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46466836'; % Ency of Life
metaData.links.id_Wiki = 'Mytilaster_minimus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3969896'; % Taxonomicon
metaData.links.id_WoRMS = '140478'; % WoRMS
metaData.links.id_molluscabase = '140478'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mytilaster}}';
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
bibkey = 'Palm2012'; type = 'Phdthesis'; bib = [ ... 
'author = {Palmeri, V.}, ' ... 
'year = {2012}, ' ...
'title = {Risposte ecologiche dei filtratori bentonici marini alla variabilit\`{a} indotta dai fenomeni antropici}, ' ...
'school = {Palermo University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaraBuff2004'; type = 'Inproceedings'; bib = [ ... 
'author = {Sar\`{a}, G. and Buffa, G.}, ' ... 
'year = {2004}, ' ...
'title = {Density and biometrical features of two co-occurring bivalves (\emph{Mytilaster minimus} and \emph{Brachidontes pharaonis}) in western {S}icily ({S}outh {T}yrrhenian)}, ' ...
'booktitle = {Proceedings of IV Italian National Congress of Marine Science (CONISMA)}, ' ...
'address = {Palermo (Italy)}, '...
'pages = {122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rina2011'; type = 'Misc'; bib = [ ...
'author = {Alessandro Rinaldi}, ' ...
'year = {2011}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mont2011'; type = 'Misc'; bib = [ ...
'author = {Valeria Montalto}, ' ...
'year = {2011}, ' ...
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

