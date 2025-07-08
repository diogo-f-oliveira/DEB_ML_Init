function [data, auxData, metaData, txtData, weights] = mydata_Aldabrachelys_gigantea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Aldabrachelys_gigantea'; 
metaData.species_en = 'Aldabra giant tortoise'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 10];

%% set data
% zero-variate data

data.ab = 107;      units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'Wiki';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 25*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 176*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 152 yr';
  
data.Lb = 5; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'ErnsBarb1989';
  comment.Lb = 'based on egg diameter';
data.Lp = 45; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for females';   bibkey.Lp = 'ADW';
  comment.Lp = 'based on remark: approximately half their full-grown size';
data.Lpm = 60; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'ADW';
  comment.Lpm = 'based on remark: approximately half their full-grown size';
data.Li = 91; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';   bibkey.Li = 'Wiki';
data.Lim = 120; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'ADW';

data.Wwb = 65.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ErnsBarb1989';
  comment.Wwb = 'based on egg diameter of 50 mm: pi/6*5^3';
data.Wwp = 19875; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'ADW';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 31250; units.Wwpm = 'g'; label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'ADW';
  comment.Wwpm = 'based on (Lpm/Lim)^3*Wwim';
data.Wwi = 159000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';
data.Wwim = 250000; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'ADW';

data.Ri  = 20/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
%% set weights for all real data
weights = setweights(data, []);

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
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6689N'; % Cat of Life
metaData.links.id_ITIS = '936901'; % ITIS
metaData.links.id_EoL = '47262448'; % Ency of Life
metaData.links.id_Wiki = 'Aldabrachelys_gigantea'; % Wikipedia
metaData.links.id_ADW = 'Aldabrachelys_gigantea'; % ADW
metaData.links.id_Taxo = '3806202'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Aldabrachelys&species=gigantea'; % ReptileDB
metaData.links.id_AnAge = 'Aldabrachelys_gigantea'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aldabrachelys_gigantea}}';
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
'howpublished = {\url{http://animaldiversity.org/accounts/Dipsochelys_dussumieri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/795005/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Geochelone_gigantea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErnsBarb1989'; type = 'Book'; bib = [ ...
'author = {C. H. Ernst and R. W. Barbour}, ' ...
'year = {1989}, ' ...
'title  = {Turtles of the world}, ' ...
'publisher = {Smithsonian Institutiun Press, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


