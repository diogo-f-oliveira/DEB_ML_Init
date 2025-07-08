function [data, auxData, metaData, txtData, weights] = mydata_Sarda_orientalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Sarda_orientalis'; 
metaData.species_en = 'Striped bonito'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.6); % K, body temp
metaData.data_0     = {'ab';  'am';  'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 30];

%% set data
% zero-variate data

data.ab = 5;        units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 47.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 102;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.05 mm of Scomber japonicus: pi/6*0.105^3';
data.Wwp = 1.33e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Lp^3.05, see F1';
data.Wwi = 13.4e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.05, see F1';

data.Ri  = 446530/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
temp.Ri = C2K(27.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 44.7
    2 58.0
    3 63.0
    4 65.0];
data.tL(:,1) = 365*(0+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DevaKuru1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01000*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79MK9'; % Cat of Life
metaData.links.id_ITIS = '172409'; % ITIS
metaData.links.id_EoL = '46577302'; % Ency of Life
metaData.links.id_Wiki = 'Sarda_sarda'; % Wikipedia
metaData.links.id_ADW = 'Sarda_sarda'; % ADW
metaData.links.id_Taxo = '46692'; % Taxonomicon
metaData.links.id_WoRMS = '127021'; % WoRMS
metaData.links.id_fishbase = 'Sarda-sarda'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sarda_sarda}}';
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
bibkey = 'DevaKuru1997'; type = 'techreport'; bib = [ ... 
'howpublished = {\url{https://core.ac.uk/download/pdf/33017552.pdf}}, ' ...
'author = {Devaraj, M. and K.N. Kurup and N.G.K. Pillai and K. Bala and E. Vivekanandan and R. Sathiadhas}, ' ...
'year = {1997}, ' ...
'title = {Status, prospects and management of small pelagic fisheries in {I}ndia}, ' ... 
'journal = {RAP Publication: Bangkok, Thailand}, ' ...
'volume = {31}, '...
'pages = {191-198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Sarda-sarda.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
