  function [data, auxData, metaData, txtData, weights] = mydata_Thymallus_arcticus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Thymallus_arcticus'; 
metaData.species_en = 'Arctic grayling'; 

metaData.ecoCode.climate = {'Dfc','ET'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 15]; 

%% set data
% zero-variate data
data.am = 18*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp = 24;     units.Lp = 'cm';    label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase'; 
data.Li = 76;     units.Li = 'cm';    label.Li = 'ultimate total length';    bibkey.Li =  'fishbase';
 
data.Wwb = 2.24e-2;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 3.5 mm: pi/6*0.35^3';
data.Wwp = 148.3;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00832*Lp^3.08, see F2';
data.Wwi = 5.16e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on  0.00832*Li^3.08, see F2';

data.Ri = 12946/365; units.Ri = '#/d';  label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';
  temp.Ri = C2K(7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL = [... % time (yr), fork length (cm)
     1  9.43
     2 13.33
     3 18.26
     4 20.80
     5 25.80
     6 31.23
     7 33.56
     8 35.47
     9 37.05
    10 36.98
    11 38.22
    12 38.80
    13 40.50
    14 37.30
    15 39.80
    16 41.80];
data.tL(:,1) = 365 * (0.75 + data.tL(:,1)); % convert year to d
data.tL(:,2) = data.tL(:,2)/0.93; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
  temp.tL = C2K(7); units.temp.tL = 'K'; label.temp.tL = 'temperature';
  bibkey.tL= 'CraiPoul1975';
  comment.tL = 'Data from Weir Creek and Kavik River; temp varied from 1.1 to 19 C in summer'; 
 
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
F1 = 'length-length from photo: FL = 0.93 * TL';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.08';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '56Q7X'; % Cat of Life
metaData.links.id_ITIS = '162016'; % ITIS
metaData.links.id_EoL = '204794'; % Ency of Life
metaData.links.id_Wiki = 'Thymallus_arcticus'; % Wikipedia
metaData.links.id_ADW = 'Thymallus_arcticus'; % ADW
metaData.links.id_Taxo = '42855'; % Taxonomicon
metaData.links.id_WoRMS = '254571'; % WoRMS
metaData.links.id_fishbase = 'Thymallus-arcticus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Thymallus_arcticus}}';  
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
bibkey = 'CraiPoul1975'; type = 'Article'; bib = [ ...  
'doi = {/10.1139/f75-088}, ' ...
'author = {P. C. Craig and V. A. Poulin}, ' ...
'year = {1975}, ' ...
'title = {Movements and Growth of {A}rctic Grayling (\emph{Thymallus arcticus}) and Juvenile {A}rctic Char (\emph{Salvelinus alpinus}) in a Small {A}rctic Stream, {A}laska}, ' ... 
'journal = {Journal of the Fisheries Research Board of Canada}, ' ...
'volume = {32(5)}, '...
'pages = {689-697}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Thymallus-arcticus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  