  function [data, auxData, metaData, txtData, weights] = mydata_Osteoglossum_bicirrhosum

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Osteoglossidae';
metaData.species    = 'Osteoglossum_bicirrhosum'; 
metaData.species_en = 'Silver arowana'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
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
data.ah = 164/24; units.ah = 'd';    label.ah = 'age at hatch';           bibkey.ah = {'Yanw2013'}; 
  temp.ah = C2K(28); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 26;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = {'Yanw2013'}; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 34*30.5;units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = {'Yanw2013'};
  temp.ap = C2K(24); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for female; for males: ap = 11 yr (Kinz1987) or 13-15 yr (Magn962)';
data.am = 30*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
comment.am = 'there is not information on this';
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 1.3;   units.L0 = 'cm';   label.L0 = 'egg diameter';  bibkey.L0 = 'WilliBron1993';
data.Lh = 1.6;    units.Lh = 'cm';   label.Lh = 'total length at hatch';  bibkey.Lh = 'Yanw2013';
data.Lb = 3.8;    units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'Yanw2013';
data.Li = 120;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Yanw2013';

%data.Ww0 = 0.95;  units.Ww0 = 'g';    label.Ww0 = 'wet weight of fertilised egg'; bibkey.Ww0 = 'Yanw2013';
data.Wwi = 11500;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 220/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Yanw2013';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Facts 
F1 = 'Breathes air; males breed eggs in mouth and carry offspring for 3 weeks. Males have bigger mouth then females';
metaData.bibkey.F1 = 'Yanw2013';
metaData.facts = struct('F1',F1);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                                 
%% Links
metaData.links.id_CoL = '75BDS'; % Cat of Life
metaData.links.id_ITIS = '161894'; % ITIS
metaData.links.id_EoL = '223395'; % Ency of Life
metaData.links.id_Wiki = 'Osteoglossum_bicirrhosum'; % Wikipedia
metaData.links.id_ADW = 'Osteoglossum_bicirrhosum'; % ADW
metaData.links.id_Taxo = '42708'; % Taxonomicon
metaData.links.id_WoRMS = '1026694'; % WoRMS
metaData.links.id_fishbase = 'Osteoglossum-bicirrhosum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Osteoglossum_bicirrhosum}}';  
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
'howpublished = {\url{http://www.fishbase.us/summary/Osteoglossum-bicirrhosum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

 
