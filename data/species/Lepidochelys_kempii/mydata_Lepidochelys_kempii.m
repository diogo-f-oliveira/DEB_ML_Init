function [data, auxData, metaData, txtData, weights] = mydata_Lepidochelys_kempii 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Cheloniidae';
metaData.species    = 'Lepidochelys_kempii'; 
metaData.species_en = 'Atlantic ridley sea turtle'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0bTd', 'biMcp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biHa'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Jocylin Pierro'};               
metaData.date_subm = [2015 04 01];                         
metaData.email    = {'jocylin.d.pierro@ttu.edu'};               
metaData.address  = {'Texas Tech University, 79415, USA'}; 

metaData.author_mod   = {'Bas Kooijman'};    
metaData.date_mod = [2015 09 14];              
metaData.email_mod    = {'bas.kooijman@vu.nl'};            
metaData.address_mod  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 

%% set data
% zero-variate data

data.ab = 55;      units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'Spot2004';   
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 11*365;    units.ap = 'd'; label.ap = 'age at puberty';           bibkey.ap = 'seeturtles';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 14600;   units.am = 'd';   label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.8;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'nmfs';  
data.Lp  = 65;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'Wiki: 60-90 cm';
data.Li  = 70.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nmfs';

data.Wwb = 14;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'nmfs';
data.Wwp = 44900; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'Approximation based on reproductive behavior occuring when physically at ultimate size';
data.Wwi = 45000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'nmfs';

data.Ri  = 0.603; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Spot2004';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.5 yr between lays, 3 clutch per lay, 20-28 d between clutches, 110 eggs per clutch';
 
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

%% Facts
F1 = ' If the temperature is below 29.5 C, the offspring will be mainly male.';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3TB2G'; % Cat of Life
metaData.links.id_ITIS = '551770'; % ITIS
metaData.links.id_EoL = '46559476'; % Ency of Life
metaData.links.id_Wiki = 'Lepidochelys_kempii'; % Wikipedia
metaData.links.id_ADW = 'Lepidochelys_kempii'; % ADW
metaData.links.id_Taxo = '48486'; % Taxonomicon
metaData.links.id_WoRMS = '137208'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Lepidochelys&species=kempii'; % ReptileDB
metaData.links.id_AnAge = 'Lepidochelys_kempii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidochelys_kempii}}';
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
bibkey = 'Spot2004'; type = 'Book'; bib = [ ...  
'author = {Spotila, J. R.}, ' ...
'year = {2004}, ' ...
'title  = {Sea Turtles: A complete Guide to Their Biology, Behavior, and Conservation}, ' ...
'publisher = {Johns Hopkins University Press}, ' ...
'pages = {(page 155-156)}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nmfs'; type = 'Misc'; bib = [ ... 
'author = {National Oceanic and Atmospheric Administration}, ' ...
'howpublished = {\url{http://www.nmfs.noaa.gov/pr/species/turtles/kempsridley.htm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seeturtles'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seeturtles.org/juvenile-turtles/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib =  ...
'howpublished = {\url{http://animaldiversity.org/accounts/Lepidochelys_kempii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

