function [data, auxData, metaData, txtData, weights] = mydata_Hybognathus_placitus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hybognathus_placitus'; 
metaData.species_en = 'Plains minnow'; 

metaData.ecoCode.climate = {'BSk', 'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa','biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_f'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 10]; 

%% set data
% zero-variate data

data.am = 2.5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishesoftexas';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5.3;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'TaylMill1990'; 
  comment.Lp = 'based on SL 4.3 cm and F2';
data.Li = 13;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'fishesoftexas';
  
data.Wwb = 1e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1.25 mm: pi/6*0.125^3';
data.Wwp = 1.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'TaylMill1990','fishbase'};
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 24.9;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
  0 1.374
  1 2.834
  2 4.464
  3 5.586
  5 6.221];
data.tL(:,1) = 30.5 * (.5 + data.tL(:,1));
data.tL(:,2) = data.tL(:,2)/ 0.81; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TaylMill1990'; 

% length - fecundity
data.LN = [ ... % std length (cm), fecundity (#)
     5.1  417
     8.7 4134];
data.LN(:,1) = data.LN(:,1)/0.81; % convert SL tp TL
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'TaylMill1990'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3MY56'; % Cat of Life
metaData.links.id_ITIS = '163361'; % ITIS
metaData.links.id_EoL = '983875'; % Ency of Life
metaData.links.id_Wiki = 'Hybognathus_placitus'; % Wikipedia
metaData.links.id_ADW = 'Hybognathus_placitus'; % ADW
metaData.links.id_Taxo = '176946'; % Taxonomicon
metaData.links.id_WoRMS = '1015723'; % WoRMS
metaData.links.id_fishbase = 'Hybognathus-placitus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hybognathus_placitus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Hybognathus-placitus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/hybognathus placitus.htm}}';  
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
bibkey = 'TaylMill1990'; type = 'article'; bib = [ ...  
'author = {Christopher M. Taylor and Rudolph J. Miller}, ' ...
'year = {1990}, ' ...
'title = {Reproductive Ecology and Population Structure of the Plains Minnow, \emph{Hybognathus placitus} ({P}isces: {C}yprinidae), in {C}entral {O}klahoma}, ' ... 
'journal = {American Midland Naturalist}, ' ...
'volume = {123(1)}, '...
'pages = {32-39}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


