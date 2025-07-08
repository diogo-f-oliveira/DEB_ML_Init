function [data, auxData, metaData, txtData, weights] = mydata_Notropis_boops
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_boops'; 
metaData.species_en = 'Bigeye shiner'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'};  
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

data.am = 3*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'LehtEche1979';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'LehtEche1979'; 
data.Li = 7.47;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'fishbase'; 
  comment.Li = 'based on TL 9 cm and F2';

data.Wwb = 5.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'LehtEche1979';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 6.15;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishbase','LehtEche1979'};
  comment.Wwi = 'based on 0.00708*(Li/0.83)^3.08, see F1; fishbase gives TL 6.5 cm';

data.GSI = 0.13 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'LehtEche1979'; 
  temp.GSI = C2K(15); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

%% univariate data
 
% time-length
data.tL = [ ... % time (mnth), std length (cm)
    2 2.1 % may
    3 3.0
    4 3.5
    5 3.8
    6 3.9
    7 3.95
    8 4.3
    9 4.7];
data.tL(:,1) = 30.5 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LehtEche1979'; 
comment.tL = 'Data from length frequency counts';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZF9'; % Cat of Life
metaData.links.id_ITIS = '163430'; % ITIS
metaData.links.id_EoL = '356671'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_boops'; % Wikipedia
metaData.links.id_ADW = 'Notropis_boops'; % ADW
metaData.links.id_Taxo = '181485'; % Taxonomicon
metaData.links.id_WoRMS = '1019858'; % WoRMS
metaData.links.id_fishbase = 'Notropis-boops'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_boops}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-boops.html}}';  
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
bibkey = 'LehtEche1979'; type = 'article'; bib = [ ... 
'author = {Steven Lehtinen and Anthony A. Echelle}, ' ... 
'year = {1979}, ' ...
'title = {Reproductive Cycle of \emph{Notropis boops} ({P}isces: {C}yprinidae) in {B}rier {C}reek, {M}arshall {C}ounty, {O}klahoma}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {102(2)}, ' ...
'pages = {237-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

