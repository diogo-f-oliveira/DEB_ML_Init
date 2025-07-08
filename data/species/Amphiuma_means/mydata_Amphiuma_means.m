function [data, auxData, metaData, txtData, weights] = mydata_Amphiuma_means
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Amphiumidae';
metaData.species    = 'Amphiuma_means'; 
metaData.species_en = 'Two-toed amphiuma'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTf', 'biFl', 'biFm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'aj';'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 15];

%% set data
% zero-variate data

data.ab = 5*30.5;   units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'amphibiaweb';
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 14;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(22);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 4*365;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'amphibiaweb';
  temp.tpm = C2K(22);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 5.5;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'amphibiaweb'; 
data.Lj  = 6;     units.Lj  = 'cm';  label.Lj  = 'total length at metam';  bibkey.Lj  = 'amphibiaweb'; 
data.Lp  = 52.8;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'amphibiaweb'; 
  comment.Lp = 'converted from SVL 39.81 by factor 325/245';
data.Lpm  = 53.7;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'amphibiaweb'; 
  comment.Lp = 'converted from SVL 40.45 by factor 325/245';
data.Li = 116;      units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li  = 'Wiki';

data.Wwb = 0.55; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg length 10.5 mm and width 10 mm: pi/6*1^2*1.05';
data.Wwp = 148.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'amphibiaweb';
data.Wwpm = 168.7;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';    bibkey.Wwpm = 'amphibiaweb';
data.Wwi = 1042;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.Ri  = 210/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

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
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Survives starvation for a period of 3 yr';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'D6GS'; % Cat of Life
metaData.links.id_ITIS = '173609'; % ITIS
metaData.links.id_EoL = '332599'; % Ency of Life
metaData.links.id_Wiki = 'Amphiuma_means'; % Wikipedia
metaData.links.id_ADW = 'Amphiuma_means'; % ADW
metaData.links.id_Taxo = '47352'; % Taxonomicon
metaData.links.id_WoRMS = '1457584'; % WoRMS
metaData.links.id_amphweb = 'Amphiuma+means'; % AmphibiaWeb
metaData.links.id_AnAge = 'Amphiuma_means'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphiuma_means}}';
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
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Amphiuma+means}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Amphiuma_means}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

