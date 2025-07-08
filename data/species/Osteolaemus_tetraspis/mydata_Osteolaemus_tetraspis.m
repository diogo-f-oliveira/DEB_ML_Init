function [data, auxData, metaData, txtData, weights] = mydata_Osteolaemus_tetraspis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodylidae';
metaData.species    = 'Osteolaemus_tetraspis'; 
metaData.species_en = 'Dwarf crocodile'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cfa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 09 16];


%% set data
% zero-variate data

data.ab = 100;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ielc';   
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'age at puberty for female';  bibkey.tp = 'ielc';
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;   units.tpm = 'd';    label.tpm = 'age at puberty for male';  bibkey.tpm = 'ielc';
  temp.tpm = C2K(23); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 70*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 21;      units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ielc'; 
  comment.Lb = '199-238 mm';
data.Lp  = 100;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ielc'; 
data.Lpm  = 100;    units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'ielc'; 
data.Li  = 151;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
  comment.Li = 'based on (Wwi/Wwim)^(1/3)*Lim';
data.Lim  = 190;    units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Ww0 = 63.7;    units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';          bibkey.Ww0 = 'ielc';
  comment.Ww0 = '56.7-70.5 g';
data.Wwb = 47.5;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ielc';
  comment.Wwb = '43.5-51.1 g';
data.Wwi = 40e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 327 cm female weighing 93 kg: (400/327)^3*93 kg';
data.Wwim = 80e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 12/365;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'ielc';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-17 eggs per litter';
  
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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'temperature effects sex of neonate; largest eggs among crocs';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6TBCB'; % Cat of Life
metaData.links.id_ITIS = '202204'; % ITIS
metaData.links.id_EoL = '1055717'; % Ency of Life
metaData.links.id_Wiki = 'Osteolaemus_tetraspis'; % Wikipedia
metaData.links.id_ADW = 'Osteolaemus_tetraspis'; % ADW
metaData.links.id_Taxo = '50643'; % Taxonomicon
metaData.links.id_WoRMS = '1478632'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Osteolaemus&species=tetraspis'; % ReptileDB
metaData.links.id_AnAge = 'Osteolaemus_tetraspis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Osteolaemus_tetraspis}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Osteolaemus_tetraspis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ielc'; type = 'Misc'; bib = ...
'howpublished = {\url{https://ielc.libguides.com/sdzg/factsheets/dwarf_crocodile/reproduction}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

