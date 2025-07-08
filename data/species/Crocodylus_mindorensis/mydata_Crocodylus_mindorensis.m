function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_mindorensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodylidae';
metaData.species    = 'Crocodylus_mindorensis'; 
metaData.species_en = 'Philippine crocodile'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 09 17];


%% set data
% zero-variate data

data.ab = 71.5;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'ADW';   
  temp.ab = C2K(31); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '65-78 d';
data.tp = 5*365;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 75*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '70-80 yrs';

data.Lp  = 130;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Lpm  = 210;    units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'Wiki'; 
data.Li  = 310;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 310;    units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Wwb = 50.5;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'MarzRuss2014';
  comment.Wwb = 'based on egg volume';
data.Wwp = 15e3;    units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'ADW';
data.Wwi = 75.3e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'EoL';
data.Wwim = 75.3e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';
  comment.Wwi = 'based on  3 m weighs 195 kg: (3.5/3)^3*195';  

data.Ri  = 60/365;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7-33 eggs per clutch, upto 3 clutches per yr';

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
F1 = 'temperature effects sex of neonate';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZKNG'; % Cat of Life
metaData.links.id_ITIS = '551773'; % ITIS
metaData.links.id_EoL = '795279'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_mindorensis'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_mindorensis'; % ADW
metaData.links.id_Taxo = '89973'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=mindorensis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_mindorensis}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Crocodylus_mindorensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/795279/data}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarzRuss2014'; type = 'Article'; bib = [ ... 
'doi = {10.1080/08912963.2013.871009}, ' ...    
'author = {Marco Marzola and Joa\˜{o} Russo and Oct\''{a}vio Mateus}, ' ...
'year = {2014}, ' ...
'title  = {Identification and comparison of modern and fossil crocodilian eggs and eggshell structures}, ' ...
'journal = {Historical Biology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

