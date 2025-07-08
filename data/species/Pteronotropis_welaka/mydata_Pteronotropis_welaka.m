function [data, auxData, metaData, txtData, weights] = mydata_Pteronotropis_welaka

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pteronotropis_welaka'; 
metaData.species_en = 'Bluenose shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fn'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa','biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 01]; 

%% set data
% zero-variate data

data.am = 2.5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 3.8;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = {'fishesoftexas','JohnKnig1999'}; 
  comment.Lp = 'value for similar species P. hubbsi';
data.Li = 6.5;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishesoftexas'; 
  
data.Wwb = 5.24e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'JohnKnig1999';
  comment.Wwb = 'based on egg diameter of 1.0 mm: pi/6*0.1^3';
data.Wwp = 0.43; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'fishbase','JohnKnig1999'};
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 2.26; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.Ri = 1129/365;   units.Ri = '#/d';  label.Ri = 'reprod rate at SL 4.95 cm, TL 5.7 cm';    bibkey.Ri = 'fishesoftexas';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Pteronotropis hubbsi, but JohnKnig1999 remarks that fecundity of both species is similar';

%% univariate data
 
% time-length
data.tL = [ ... % time (yr), std length (cm)
    0.25 1.8
    0.50 3.5
    0.75 4.0
    1.00 4.3
    1.25 4.5];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
data.tL(:,2) = data.tL(:,2)/0.86; % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JohnKnig1999';
comment.tL = 'stylized data from length-frequencies';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.86 * TL';
metaData.bibkey.F2 = 'fishesoftexas';
F3 = 'This minnow lays its egg in that of a sunfish, which is protected by the male sunfish';
metaData.bibkey.F3 = 'srs';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3); 

%% Links
metaData.links.id_CoL = '4PZZ8'; % Cat of Life
metaData.links.id_ITIS = '201943'; % ITIS
metaData.links.id_EoL = '220998'; % Ency of Life
metaData.links.id_Wiki = 'Pteronotropis_welaka'; % Wikipedia
metaData.links.id_ADW = 'Pteronotropis_welaka'; % ADW
metaData.links.id_Taxo = '691749'; % Taxonomicon
metaData.links.id_WoRMS = '1026840'; % WoRMS
metaData.links.id_fishbase = 'Pteronotropis-welaka'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pteronotropis_welaka}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pteronotropis-welaka.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/http://txstate.fishesoftexas.org/pteronotropis hubbsi.htm}}';  
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
bibkey = 'JohnKnig1999'; type = 'Article'; bib = [ ... 
'author = {Carol E. Johnston and Charles L. Knight}, ' ... 
'year = {1999}, ' ...
'title = {Life-history traits of the bluenose shiner, \emph{Pteronotropis welaka} ({C}ypriniformes: {C}yprinidae}, ' ...
'journal = {Copiea}, ' ...
'volume = {1999(1)}, ' ...
'pages = {200-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'srs'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.srs.fs.usda.gov/pubs/750}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

