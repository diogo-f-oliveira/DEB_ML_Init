function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_palustris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodylidae';
metaData.species    = 'Crocodylus_palustris'; 
metaData.species_en = 'Mugger crocodile'; 

metaData.ecoCode.climate = {'Am','BSh','Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFc', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'bpCva', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
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

data.ab = 65;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'ADW';   
  temp.ab = C2K(31); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '55-75 d';
data.tp = 9*365;      units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';   
  temp.tp = C2K(23); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '8-10 yr';
data.tpm = 13.5*365;      units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'ADW';   
  temp.tpm = C2K(23); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '12-15 yr';
data.am = 44*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 28.5;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW'; 
  comment.Lb = '26-31 cm';
data.Lp  = 200;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
  comment.Lp = '180-200 cm';
data.Lpm  = 260;    units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty';bibkey.Lpm  = 'Wiki'; 
data.Li  = 250;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 350;    units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';
  comment.Li = 'upto 5 m';

data.Wwb = 128;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Wiki';
data.Wwi = 113e3;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on 3 m weighs 195 kg: (2.5/3)^3*195';
data.Wwim = 310e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';
  comment.Wwim = 'based on 3 m weighs 195 kg: (3.5/3)^3*195; ADW gives upto 700 kg';

data.Ri  = 46/365;  units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23);units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-46 eggs per clutch, upto 2 clutches per yr';

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
metaData.links.id_CoL = 'ZKNN'; % Cat of Life
metaData.links.id_ITIS = '202196'; % ITIS
metaData.links.id_EoL = '795277'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_palustris'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_palustris'; % ADW
metaData.links.id_Taxo = '50635'; % Taxonomicon
metaData.links.id_WoRMS = '1398059'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=palustris'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_palustris'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_palustris}}';
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
'howpublished = {\url{https://animaldiversity.org/accounts/Crocodylus_palustris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Crocodylus_palustris}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

