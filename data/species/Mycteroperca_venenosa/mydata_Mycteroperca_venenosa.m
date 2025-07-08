function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_venenosa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_venenosa'; 
metaData.species_en = 'Yellowfin grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 31];

%% set data
% zero-variate data

data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 31 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'BurtPott2015';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 80;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Lp  = 53.6;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 100;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 2e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01122*Lp^3.04, see F1';
data.Wwi = 13.5e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01122*Li^3.04, see F1; max published weight 18.5 kg';
 
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(27); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Mycteroperca_bonaci';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
    3  42.8
    4  53.3
    5  58.3
    6  61.8
    7  64.9
    8  68.7
    9  71.7
   10  73.6
   11  75.3
   12  78.2
   13  79.3
   14  82.8
   15  82.1
   16  84.7
   17  87.4
   18  87.1
   19  88.4
   20  88.2
   21  88.0
   22  92.2
   24  99.8
   25  87.0
   28 100.0
   31  90.0];
data.tL(:,1) = 365*(data.tL(:,1)+0); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BurtPott2015'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01122*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44ZPL'; % Cat of Life
metaData.links.id_ITIS = '167764'; % ITIS
metaData.links.id_EoL = '46579711'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_venenosa'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_venenosa'; % ADW
metaData.links.id_Taxo = '180515'; % Taxonomicon
metaData.links.id_WoRMS = '273885'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-venenosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_venenosa}}';
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
bibkey = 'BurtPott2015'; type = 'article'; bib = [ ... 
'doi = {10.7717/peerj.1099}, ' ...
'author = {Michael L. Burton and Jennifer C. Potts and Daniel R. Carr}, ' ... 
'year = {2015}, ' ...
'title = {Age, growth, and natural mortality of yellowfin grouper (\emph{Mycteroperca venenosa}) from the southeastern {U}nited {S}tates}, ' ...
'journal = {PeerJ}, ' ...
'volume = {3}, ' ...
'pages = {e1099}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Mycteroperca-venenosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

