function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_porosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodilidae';
metaData.species    = 'Crocodylus_porosus'; 
metaData.species_en = 'Saltwater crocodile'; 

metaData.ecoCode.climate = {'MA', 'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPa', 'TA'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFr', 'biMc'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'biCv'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 28];


%% set data
% zero-variate data

data.ab = 80;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Brie2015';   
  temp.ab = C2K(32); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 11*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female';  bibkey.tp = 'ADW';
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '10 to 12 yr';
data.tpm = 16*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for female';  bibkey.tpm = 'ADW';
  temp.tpm = C2K(23); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 57*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 29;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.Lp  = 210;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Lpm  = 330;     units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'Wiki'; 
data.Li  = 430;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 700;     units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 71;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'Wiki','Brie2015'};
  comment.Wwb = '41.4 to 93.6 g';
data.Wwp  = 55e3;   units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty of female';  bibkey.Wwp = 'Wiki';
data.Wwpm = 215e3;   units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty of male';  bibkey.Wwpm = 'Wiki';
data.Wwi = 475e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'Wiki';
data.Wwim = 2.05e6;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'EoL';

data.Ri  = 50/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at 364 cm';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '40 to 60 eggs per clutch';
    
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.k_J = 0; weights.psd.k = 0.2;
weights.psd.v = 3 * weights.psd.v;

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
F1 = 'temperature effects sex of neonate: below  31.7 C or above 34.5 C neonates are female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZKNP'; % Cat of Life
metaData.links.id_ITIS = '174364'; % ITIS
metaData.links.id_EoL = '46559654'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_porosus'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_porosus'; % ADW
metaData.links.id_Taxo = '50636'; % Taxonomicon
metaData.links.id_WoRMS = '344030'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=porosus'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_porosus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_porosus}}';
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
bibkey = 'Brie2015'; type = 'phdthesis'; bib = [ ... 
'author = {Matthew Lindsay Brien}, ' ... 
'year = {2015}, ' ...
'title = {Growth and survival of hatchling saltwater crocodiles (\emph{Crocodylus porosus}) in captivity: the role of agonistic and thermal behaviour}, ' ...
'school = {Research Institute for the Environment and Livelihoods, Charles Darwin University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crocodylus_porosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Crocodylus_porosus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46559654/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];