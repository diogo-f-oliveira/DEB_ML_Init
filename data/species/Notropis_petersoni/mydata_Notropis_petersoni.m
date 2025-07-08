function [data, auxData, metaData, txtData, weights] = mydata_Notropis_petersoni
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_petersoni'; 
metaData.species_en = 'Coastal shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 14]; 

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4.4;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'DaviLoud1971'; 
data.Li = 8.2;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 

data.Wwb = 1.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'DaviLoud1971';
  comment.Wwb = 'based on egg diameter of 1,3 mm: pi/6*0.13^3';
data.Wwi = 4.62;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.R6  = 408/365; units.R6  = '#/d';label.R6  = 'max reprod rate at TL 5.9 cm';    bibkey.R6  = 'fishesoftexas';   
  temp.R6 = C2K(20); units.temp.R6 = 'K'; label.temp.R6 = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
    1 2.42
    2 4.64
    3 5.91];
data.tL(:,1) = 365 * (-0.5 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DaviLoud1971'; 

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    4.5 328
    5.5 485
    6.5 629
    7.6 854];
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DaviLoud1971'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed nor to differ from females';
D2 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.82 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZJJ'; % Cat of Life
metaData.links.id_ITIS = '163460'; % ITIS
metaData.links.id_EoL = '208003'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_petersoni'; % Wikipedia
metaData.links.id_ADW = 'Notropis_petersoni'; % ADW
metaData.links.id_Taxo = '181532'; % Taxonomicon
metaData.links.id_WoRMS = '1014420'; % WoRMS
metaData.links.id_fishbase = 'Notropis-petersoni'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_petersoni}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-petersoni.html}}';  
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
bibkey = 'DaviLoud1971'; type = 'article'; bib = [ ... 
'doi = {10.1577/1548-8659(1971)100<726:LHAEOT>2.0.CO;2}, ' ...
'author = {James R. Davis and Darrell E. Louder}, ' ... 
'year = {1971}, ' ...
'title = {Life History and Ecology of the Cyprinid Fish \emph{Notropis petersoni} in {N}orth {C}arolina Waters}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {100(4)}, ' ...
'pages = {726-733}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  

