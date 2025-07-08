function [data, auxData, metaData, txtData, weights] = mydata_Tomistoma_schlegelii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Gavialidae';
metaData.species    = 'Tomistoma_schlegelii'; 
metaData.species_en = 'False gharial'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 17];


%% set data
% zero-variate data

data.ab = 95;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(29); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '90-100 d';
data.tp = 20*365;  units.tp = 'd';    label.tp = 'age at puberty for female';  bibkey.tp = 'ADW';
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 20*365;  units.tpm = 'd';    label.tpm = 'age at puberty for male';  bibkey.tpm = 'ADW';
  temp.tpm = C2K(23); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 80*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 24.7 yrs';

data.Lp  = 275;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ADW'; 
  comment.Lp = '2.5-3 m';
data.Lpm  = 275;     units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'ADW'; 
data.Li  = 400;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
  comment.Li = '4-5 m';
data.Lim  = 500;     units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Ww0 = 155;      units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';          bibkey.Ww0 = 'ADW';
data.Wwi = 170e3;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 327 cm female weighing 93 kg: (400/327)^3*93 kg';
data.Wwim = 210e3;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 40/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20-60 eggs/clutch';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lp = 3 * weights.Lp;
weights.Lpm = 3 * weights.Lpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: k_J reduced in view of low [p_M]; pseudo-data k=0.3 is added';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'temperature effects sex of neonate';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57D4X'; % Cat of Life
metaData.links.id_ITIS = '202208'; % ITIS
metaData.links.id_EoL = '790453'; % Ency of Life
metaData.links.id_Wiki = 'Tomistoma_schlegelii'; % Wikipedia
metaData.links.id_ADW = 'Tomistoma_schlegelii'; % ADW
metaData.links.id_Taxo = '50649'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Tomistoma&species=schlegelii'; % ReptileDB
metaData.links.id_AnAge = 'Tomistoma_schlegelii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tomistoma_schlegelii}}';
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
'howpublished = {\url{https://animaldiversity.org/accounts/Tomistoma_schlegelii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Tomistoma_schlegelii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];