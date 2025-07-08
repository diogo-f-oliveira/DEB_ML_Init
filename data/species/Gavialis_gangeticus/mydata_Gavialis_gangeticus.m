function [data, auxData, metaData, txtData, weights] = mydata_Gavialis_gangeticus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Gavialidae';
metaData.species    = 'Gavialis_gangeticus'; 
metaData.species_en = 'Gharial'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'L_t'; 'Ww0'; 'Wwb'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01];


%% set data
% zero-variate data

data.ab = 82;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(35); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '71-93 d';
data.ap = 16*365;  units.ap = 'd';    label.ap = 'age at puberty for female';  bibkey.ap = 'sandiegozoo';
  temp.ap = C2K(23); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 100*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'sandiegozoo';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 37;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Wiki';  
data.L18  = 100;     units.L18  = 'cm';  label.L18  = 'total length at 18 months';   bibkey.L18  = 'Wiki';  
  temp.L18 = C2K(23); units.temp.L18 = 'K'; label.temp.L18 = 'temperature';
data.Lp  = 300;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'sandiegozoo'; 
data.Lpm  = 350;     units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'sandiegozoo'; 
data.Li  = 375;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 625;     units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Ww0 = 160;      units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';          bibkey.Ww0 = 'Wiki';
data.Wwb = 130;      units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'sandiegozoo';
data.Wwim = 977e3;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 37/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at 364 cm';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20-95 eggs/clutch';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'temperature effects sex of neonate; largest eggs among crocs';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FFQ3'; % Cat of Life
metaData.links.id_ITIS = '202218'; % ITIS
metaData.links.id_EoL = '794627'; % Ency of Life
metaData.links.id_Wiki = 'Gavialis_gangeticus'; % Wikipedia
metaData.links.id_ADW = 'Gavialis_gangeticus'; % ADW
metaData.links.id_Taxo = '50652'; % Taxonomicon
metaData.links.id_WoRMS = '1041091'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gavialis&species=gangeticus'; % ReptileDB
metaData.links.id_AnAge = 'Gavialis_gangeticus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gavialis_gangeticus}}';
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
bibkey = 'sandiegozoo'; type = 'Misc'; bib = ...
'howpublished = {\url{http://library.sandiegozoo.org/factsheets/gharial/gharial.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
