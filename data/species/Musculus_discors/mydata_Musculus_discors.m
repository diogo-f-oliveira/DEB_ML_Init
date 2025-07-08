function [data, auxData, metaData, txtData, weights] = mydata_Musculus_discors

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytilida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Musculus_discors'; 
metaData.species_en = 'Green crenella'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MN','MAN','MAb','MAm','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mn'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 06]; 

%% set data
% zero-variate data

data.am = 8*365; units.am = 'd';    label.am = 'life span'; bibkey.am = 'guess';   
  temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.1; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'guess';
data.Lp  = 0.7; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 2.2;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'marlin';
  comment.Li = 'based on tL data';

data.Wwi = 0.39; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on .03693*Li^3 for Mytilus edulis';

data.Ri  = 96/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.99, close to that for Mytilus edulis';

% uni-variate data

% time-length 
data.tL = [ ... % time since birth (a), shell length (cm)
    0 0.1 % guess
    1 0.6
    2 1.05
    3 1.3];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'marlin';
comment.tL = 'Data from east Greenland';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Ri = 0 * weights.Ri;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% discussion
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Forms a nest or cage, enclosing the adult extending siphons,  with its byssis threads in which it lays eggs in mucus strings; no pelagic stage';
metaData.bibkey.F1 = 'marlin'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44QBB'; % Cat of Life
metaData.links.id_ITIS = '79475'; % ITIS
metaData.links.id_EoL = '46466803'; % Ency of Life
metaData.links.id_Wiki = 'Musculus_discors'; % Wikipedia
metaData.links.id_ADW = 'Musculus_discors'; % ADW
metaData.links.id_Taxo = '84884'; % Taxonomicon, server down
metaData.links.id_WoRMS = '140472'; % WoRMS
metaData.links.id_molluscabase = '140472'; % MolluscaBase

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.marlin.ac.uk/species/detail/1645}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

