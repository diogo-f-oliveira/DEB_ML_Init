function [data, auxData, metaData, txtData, weights] = mydata_Notropis_bifrenatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_bifrenatus'; 
metaData.species_en = 'Bridled shiner'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
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

data.am = 1.2*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'Harr1948';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 2.3;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'Harr1948'; 
data.Li = 4.8;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'Harr1948'; 

data.Wwb = 3.2e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Harr1948';
  comment.Wwb = 'based on egg diameter of 0.85 mm: pi/6*0.085^3';
data.Wwi = 1.57;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = {'fishbase','Harr1948'};
  comment.Wwi = 'based on 0.00708*(Li/0.83)^3.08, see F1; fishbase gives TL 6.5 cm';

%% univariate data
 
% time-length
data.tL = [ ... % time in july 1 (d), std length (cm)
    4  1.10
    7  1.16
   10  1.17
   12  0.88
   17  1.17
   22  1.13
   24  1.27
   29  1.31
   31  1.42
   36  1.69
   49  1.65];
data.tL(:,1) = 20 + data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Harr1948'; 
comment.tL = 'Data from length frequency counts';

% length - fecundity
data.LN = [ ... % std length (cm), fecundity (#)
    2.5  135
    3.4  531
    4.4 1055];
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Harr1948'; 
comment.LN = 'Data from May';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

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
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZF6'; % Cat of Life
metaData.links.id_ITIS = '163402'; % ITIS
metaData.links.id_EoL = '47261954'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_bifrenatus'; % Wikipedia
metaData.links.id_ADW = 'Notropis_bifrenatus'; % ADW
metaData.links.id_Taxo = '181483'; % Taxonomicon
metaData.links.id_WoRMS = '888531'; % WoRMS
metaData.links.id_fishbase = 'Notropis-bifrenatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_bifrenatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-bifrenatus.html}}';  
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
bibkey = 'Harr1948'; type = 'article'; bib = [ ... 
'author = {Robert W. Harrington}, ' ... 
'year = {1948}, ' ...
'title = {The Life Cycle and Fertility of the Bridled Shiner, \emph{Notropis bifrenatus} ({C}ope)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {39(1)}, ' ...
'pages = {83-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

