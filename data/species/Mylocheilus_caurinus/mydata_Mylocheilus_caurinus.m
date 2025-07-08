function [data, auxData, metaData, txtData, weights] = mydata_Mylocheilus_caurinus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Mylocheilus_caurinus'; 
metaData.species_en = 'Peamouth'; 

metaData.ecoCode.climate = {'BSk','Dsb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi','jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 25];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 25]; 

%% set data
% zero-variate data

data.am = 5.5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'Scot1952';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 21;    units.Lp = 'cm'; label.Lp = 'total length at puberty';    bibkey.Lp = 'Cart1959'; 
data.Li = 36;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase'; 
  
data.Wwb = 2.4e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Cart1959';
  comment.Wwb = 'based on egg diameter of 1.165 mm: pi/6*0.165^3';
data.Wwp = 180;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','MoylBaxt2004'};
  comment.Wwi = 'based on 0.00813*Lp^3.13, see F1';
data.Wwi = 604;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.13, see F1';


%% univariate data
 
% time-length
data.tL = [ ... % yr class (yr), fork length (cm)
    1  5.00
    2 10.50
    3 14.00
    4 16.75
    5 19.50];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d since birth
data.tL(:,2) = data.tL(:,2)/ 0.88; % convert FL to TL
units.tL = {'d', 'cm'}; label.tL = {'time since hatch', 'total length'};  
temp.tL = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Scot1952'; 

% length-fecundity
data.LN = [ ... % yr class (yr), fork length (cm)
19.039	4702.041
21.019	6661.224
24.981	12661.224
27.058	14840.816];
data.LN(:,1) = data.LN(:,1)/ 0.88; % convert FL to TL
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(16);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Cart1959'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as T(t)=11+9*cos(t*2*pi/365) in C';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: FL=0.88*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '4545K'; % Cat of Life
metaData.links.id_ITIS = '163521'; % ITIS
metaData.links.id_EoL = '46581664'; % Ency of Life
metaData.links.id_Wiki = 'Mylocheilus_caurinus'; % Wikipedia
metaData.links.id_ADW = 'Mylocheilus_caurinus'; % ADW
metaData.links.id_Taxo = '180561'; % Taxonomicon
metaData.links.id_WoRMS = '281605'; % WoRMS
metaData.links.id_fishbase = 'Mylocheilus-caurinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mylocheilus_caurinus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pogonichthys-macrolepidotus.html}}';  
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
bibkey = 'Scot1952'; type = 'phdthesis'; bib = [ ... 
'author = {Ruth Navarre Scott}, ' ...
'year = {1952}, ' ...
'title  = {The time of spawning age and secondary sex character of adult chubs (\emph{Mylocheilus caurinum}) from {F}lathead {L}ake {M}ontana as correlated with histological changes in their testes}, ' ...
'school = {Univ. of Montana}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Cart1959'; type = 'phdthesis'; bib = [ ... 
'author = {John Willian Cartwright}, ' ...
'year = {1959}, ' ...
'title  = {Egg size and egg number in some freshwater fish of {B}ritish {C}olumbia}, ' ...
'school = {Univ. of British Columbia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

