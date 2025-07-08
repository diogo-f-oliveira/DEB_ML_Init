function [data, auxData, metaData, txtData, weights] = mydata_Urocitellus_beldingi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Urocitellus_beldingi'; 
metaData.species_en = 'Belding''s ground squirrel'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 02];              

%% set data
% zero-variate data

data.tg = 26;    units.tg = 'd';     label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '95 till 111 d';
data.tx = 24;    units.tx = 'd';     label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 547;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35.5); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6*365;    units.am = 'd'; label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(35.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data from Urocitellus_richardsonii and uncertain';
  
data.Wwb = 6.87;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 55;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 290;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';

data.Ri  = 5.7/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.7 pups per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
    0   6.87
    5  15.10
   10  26.55
   15  40.99
   20  54.42
   25  69.00
   30  86.47
   35 115.86
   40 135.60
   45 170.73
   50 190.51];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(35.5);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'MortTung1971';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7DTRM'; % Cat of Life
metaData.links.id_ITIS = '930315'; % ITIS
metaData.links.id_EoL = '327991'; % Ency of Life
metaData.links.id_Wiki = 'Urocitellus_beldingi'; % Wikipedia
metaData.links.id_ADW = 'Spermophilus_beldingi'; % ADW
metaData.links.id_Taxo = '5726067'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401003'; % MSW3
metaData.links.id_AnAge = 'Urocitellus_beldingi'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urocitellus_beldingi}}';
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
bibkey = 'MortTung1971'; type = 'Article'; bib = [ ...  
'author = {Martin L. Morton and Hsing-chu Lucy Tung}, ' ...
'year = {1971}, ' ...
'title  = {Growth and Development in the Belding Ground Squirrel (\emph{Spermophilus beldingi beldingi})}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {52(3)}, ' ...
'pages = {611-616}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Urocitellus_beldingi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

