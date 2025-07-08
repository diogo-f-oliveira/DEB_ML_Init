function [data, auxData, metaData, txtData, weights] = mydata_Hybognathus_nuchalis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hybognathus_nuchalis'; 
metaData.species_en = 'Mississippi silvery minnow'; 

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

data.am = 2*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'fishesoftexas';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4.6;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'RamiPill2018'; 
  comment.Lp = 'based on SL 3.7 cm and F2';
data.Li = 18;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'fishesoftexas';
  
data.Wwb = 2.68e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.78;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 52;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0 7.5
    1 10.0];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas'; 

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    10.2 2054
    10.7 3105];
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'fishesoftexas'; 
comment.LN = 'Data from culture';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

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
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3MY54'; % Cat of Life
metaData.links.id_ITIS = '163360'; % ITIS
metaData.links.id_EoL = '983874'; % Ency of Life
metaData.links.id_Wiki = 'Hybognathus_nuchalis'; % Wikipedia
metaData.links.id_ADW = 'Hybognathus_nuchalis'; % ADW
metaData.links.id_Taxo = '176945'; % Taxonomicon
metaData.links.id_WoRMS = '1021474'; % WoRMS
metaData.links.id_fishbase = 'Hybognathus-nuchalis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hybognathus_nuchalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Hybognathus-nuchalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/hybognathus nuchalis.htm}}';  
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
bibkey = 'RamiPill2018'; type = 'article'; bib = [ ...  
'author = {Ram\''{i}rez-Garc\''{i}a, Arely and Piller, Kyle R.}, ' ...
'year = {2018}, ' ...
'title = {Aspects of the Reproductive Biology and Growth of the {M}ississippi Silvery Minnow, \emph{Hybognathus nuchalis} ({A}gassiz, 1855) ({T}eleostei: {C}yprinidae) from the {P}earl {R}iver, {L}ouisiana}, ' ... 
'journal = {Southeastern Fishes Council Proceedings}, ' ...
'volume = {58}, '...
'pages = {1113-1116}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


