function [data, auxData, metaData, txtData, weights] = mydata_Meda_fulgida
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Meda_fulgida'; 
metaData.species_en = 'Spikedace'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','jiFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 15]; 

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'BarbWill1970';   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4.56;    units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'BarbWill1970';
  comment.Lp = 'based on SL 3.9';
data.Li = 9.1;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase'; 
  
data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'BarbWill1970';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 0.76;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';         bibkey.Wwp = {'fishbase','BarbWill1970'};
  comment.Wwp = 'based on 0.00708*Lp^3.08, F1';
data.Wwi = 6.37;   units.Wwi = 'g';  label.Wwi = 'wet weight at birth';         bibkey.Wwi = {'fishbase','BarbWill1970'};
  comment.Wwi = 'based on 0.00708*Li^3.08, F1';

data.Ri = 1749/365; units.Ri = '#/d';  label.Ri = 'reprod rate at SL 92 mm, TL 108 mm';  bibkey.Ri = 'BarbWill1970';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time (mnth), std length (cm)
    0.5 1.1
    1   1.9
    2   2.3
    3   2.7
    4   3.0
    5   3.3
    6   3.6
    8   4.0
   10   4.2
   12   4.3];
data.tL(:,1) = 30.5 * (2 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.855; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BarbWill1970'; 
comment.tL = 'Data from Aravaipa Creek, Arizona';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.855 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3YMSS'; % Cat of Life
metaData.links.id_ITIS = '163583'; % ITIS
metaData.links.id_EoL = '207876'; % Ency of Life
metaData.links.id_Wiki = 'Meda_fulgida'; % Wikipedia
metaData.links.id_ADW = 'Meda_fulgida'; % ADW
metaData.links.id_Taxo = '179670'; % Taxonomicon
metaData.links.id_WoRMS = '1021389'; % WoRMS
metaData.links.id_fishbase = 'Meda-fulgida'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Meda_fulgida}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Meda-fulgida.html}}';  
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
bibkey = 'BarbWill1970'; type = 'article'; bib = [ ...  
'author = {Willard E. Barber and David C. Williams and W. L. Minckley}, ' ...
'year = {1970}, ' ...
'title  = {Biology of the Gila Spikedace, \emph{Meda fulgida}, in {A}rizona}, ' ...
'journal = {Copeia}, ' ...
'pages = {9-18}, ' ...
'volume = {1970(1)}' ];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
