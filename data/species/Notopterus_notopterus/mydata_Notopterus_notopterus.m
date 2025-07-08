  function [data, auxData, metaData, txtData, weights] = mydata_Notopterus_notopterus

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Notopteridae';
metaData.species    = 'Notopterus_notopterus'; 
metaData.species_en = 'Bronze featherback'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 04 18];                           
metaData.email    = {'Bas.Kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, the Boelelaan 1085, 1081 HV Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 11]; 

%% set data
% zero-variate data
data.ah = 188/24; units.ah = 'd';    label.ah = 'age at hatch';           bibkey.ah = {'Yanw2013'}; 
  temp.ah = C2K(27);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
  comment.ah = 'temps of all data are guessed';
data.ab = 17;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = {'Yanw2013'}; 
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.ap = 30*30.5;units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = {'Yanw2013'};
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature'; 
  comment.ap = 'for female; for males: ap = 11 yr (Kinz1987) or 13-15 yr (Magn1962)';
data.am = 30*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh = 0.39;   units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'Yanw2013';
data.Lb = 1.62;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'Yanw2013';
data.Lp = 27.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Yanw2013';
data.Li = 60;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.W23 = 130;   units.W23 = 'g';   label.W23 = 'wet weight at total length 23.7 cm'; bibkey.W23 = 'Yanw2013';
  
data.Ri = 220/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Yanw2013';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
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

%% Links
metaData.links.id_CoL = '47Y7T'; % Cat of Life
metaData.links.id_ITIS = '161911'; % ITIS
metaData.links.id_EoL = '47262043'; % Ency of Life
metaData.links.id_Wiki = 'Notopterus_notopterus'; % Wikipedia
metaData.links.id_ADW = 'Notopterus_notopterus'; % ADW
metaData.links.id_Taxo = '42730'; % Taxonomicon
metaData.links.id_WoRMS = '281795'; % WoRMS
metaData.links.id_fishbase = 'Notopterus-notopterus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notopterus_notopterus}}';  
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
bibkey = 'Yanw2013'; type = 'Phdthesis'; bib = [ ...    
'author = {Yanwirsal, H.}, ' ...
'year  = {2013}, ' ...
'title = {Reproductive styles of {O}steoglossomorpha with emphasis on \emph{Notopterus notopterus} and \emph{Osteoglossum bicirrhosum}}, ' ...  
'school = {Humboldt-Univ Berlin}, ' ...
'howpublished = {\url{http://edoc.hu-berlin.de/dissertationen/yanwirsal-honesty-2013-05-16/PDF/yanwirsal.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.mnhn.fr/summary/Speciessummary.php?id=7990}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

