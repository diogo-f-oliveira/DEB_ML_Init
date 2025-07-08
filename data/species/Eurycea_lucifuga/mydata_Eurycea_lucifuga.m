function [data, auxData, metaData, txtData, weights] = mydata_Eurycea_lucifuga

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Eurycea_lucifuga'; 
metaData.species_en = 'Spotted-tail salamander'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah_T'; 'ab_T'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'dLb_10'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 12]; 

%% set data
% zero-variate data

data.ah10 = 72.8;      units.ah10 = 'd';    label.ah10 = 'age at hatch';        bibkey.ah10 = 'RingLips2007';   
  temp.ah10 = C2K(10); units.temp.ah10 = 'K'; label.temp.ah10 = 'temperature';
data.ah15 = 24.6;      units.ah15 = 'd';    label.ah15 = 'age at hatch';        bibkey.ah15 = 'RingLips2007';   
  temp.ah15 = C2K(15); units.temp.ah15 = 'K'; label.temp.ah15 = 'temperature';
data.ah21 = 18;        units.ah21 = 'd';    label.ah21 = 'age at hatch';         bibkey.ah21 = 'RingLips2007';   
  temp.ah21 = C2K(21); units.temp.ah21 = 'K'; label.temp.ah21 = 'temperature';
data.ab10 = 106;       units.ab10 = 'd';    label.ab10 = 'age at birth';        bibkey.ab10 = 'RingLips2007';   
  temp.ab10 = C2K(10); units.temp.ab10 = 'K'; label.temp.ab10 = 'temperature';
data.ab15 = 100;       units.ab15 = 'd';    label.ab15 = 'age at birth';        bibkey.ab15 = 'RingLips2007';   
  temp.ab15 = C2K(15); units.temp.ab15 = 'K'; label.temp.ab15 = 'temperature';
data.ab21 = 74;        units.ab21 = 'd';    label.ab21 = 'age at birth';         bibkey.ab21 = 'RingLips2007';   
  temp.ab21 = C2K(21); units.temp.ab21 = 'K'; label.temp.ab21 = 'temperature';
data.am = 9.1*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 1.2;        units.Lh  = 'cm';  label.Lh  = 'total length at hatch';   bibkey.Lh  = 'RingLips2007';
  comment.Lb = 'TL at yolk absorption';
data.Lb  = 1.82;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'RingLips2007';
  comment.Lb = 'TL at yolk absorption';
data.Lp  = 7.8;        units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'amphibiaweb'; 
  comment.Lp = 'converted from SVL 4.8 cm: 22/13.5*4.8';
data.Lpm  = 7.5;       units.Lpm  = 'cm';  label.Lpm  = 'total length  at puberty for males'; bibkey.Lpm  = 'amphibiaweb'; 
  comment.Lpm = 'converted from SVL 4.6 cm: 22/13.5*4.6';
data.Li  = 10;         units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwi = 3.7;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Hutc1958';
  comment.Wwi = 'largest mentioned body weight, not clear if this is maximum weight';

data.Ri  = 17/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch each other yr';

data.dLb10 = 0.05;     units.dLb10 = 'cm/d';    label.dLb10 = 'change in TL at birth'; bibkey.dLb10 = 'RingLips2007';   
  temp.dLb10 = C2K(10);  units.temp.dLb10 = 'K'; label.temp.dLb10 = 'temperature'; 
data.dLb15 = 0.07;     units.dLb15 = 'cm/d';    label.dLb15 = 'change in TL at birth'; bibkey.dLb15 = 'RingLips2007';   
  temp.dLb15 = C2K(15);  units.temp.dLb15 = 'K'; label.temp.dLb15 = 'temperature'; 
data.dLb21 = 0.09;     units.dLb21 = 'cm/d';    label.dLb21 = 'change in TL at birth'; bibkey.dLb21 = 'RingLips2007';   
  temp.dLb21 = C2K(21);  units.temp.dLb21 = 'K'; label.temp.dLb21 = 'temperature'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Cave dweller: troglophilic species';
metaData.bibkey.F1 = 'RingLips2007'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3D3H6'; % Cat of Life
metaData.links.id_ITIS = '1106336'; % ITIS
metaData.links.id_EoL = '1019113'; % Ency of Life
metaData.links.id_Wiki = 'Eurycea_lucifuga'; % Wikipedia
metaData.links.id_ADW = 'Eurycea_lucifuga'; % ADW
metaData.links.id_Taxo = '47414'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Eurycea+lucifuga'; % AmphibiaWeb
metaData.links.id_AnAge = 'Eurycea_lucifuga'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eurycea_lucifuga}}';
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
bibkey = 'RingLips2007'; type = 'Article'; bib = [ ... 
'author = {Adam M. Ringia and Karen R. Lips}, ' ... 
'year = {2007}, ' ...
'title = {OVIPOSITION, EARLY DEVELOPMENT AND GROWTH OF THE CAVE SALAMANDER, \emph{Eurycea lucifuga}: {S}URFACE AND SUBTERRANEAN INFLUENCES ON A TROGLOPHILIC SPECIES}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {63}, ' ...
'pages = {258-268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hutc1958'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1942273}, ' ...
'author = {Hutchison, V. H.}, ' ... 
'year = {1958}, ' ...
'title = {The Distribution and Ecology of the Cave Salamander, \emph{Eurycea lucifuga}}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {28}, ' ...
'pages = {1-20}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/species/4053}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eurycea_lucifuga}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/333692/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

