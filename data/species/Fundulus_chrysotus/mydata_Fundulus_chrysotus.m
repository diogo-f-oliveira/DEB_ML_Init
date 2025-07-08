  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_catenatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_chrysotus'; 
metaData.species_en = 'Golden topminnow'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','piHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lt'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {''}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 16]; 

%% set data
% zero-variate data
data.tp = 305;        units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'fishesoftexas';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'fishesoftexas';
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.L91 = 3.75;  units.L91 = 'cm';     label.L91 = 'total length at 91 d'; bibkey.L91 = 'fishesoftexas'; 
  comment.L91 = 'based on SL 3 cm and F2';
data.Li = 8.88;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';
  comment.Li = 'based on SL 7.1 cm and F2';

data.Wwb = 9.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 2.6 mm of Fundulus parvipinnis: pi/6*0.26^3';
data.Wwi = 12.9;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','fishesoftexas'};   
  comment.Wwi = 'based on 0.01413*Li^3.10, see F1';

data.Ri = 245/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on F. catenatus';
    
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
F1 = 'length-weight: Ww in g = 0.01413 *(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.8 * TL'; 
metaData.bibkey.F2 = 'fishesoftexas'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6K3DK'; % Cat of Life
metaData.links.id_ITIS = '165652'; % ITIS
metaData.links.id_EoL = '211784'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_chrysotus'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_chrysotus'; % ADW
metaData.links.id_Taxo = '44517'; % Taxonomicon
metaData.links.id_WoRMS = '422553'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-chrysotus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_chrysotus}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-catenatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/fundulus chrysotus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

