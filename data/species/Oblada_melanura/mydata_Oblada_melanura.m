function [data, auxData, metaData, txtData, weights] = mydata_Oblada_melanura
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Oblada_melanura'; 
metaData.species_en = 'Saddled seabream'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf','D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L', 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 22];

%% set data
% zero-variate data

data.ab = 4;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(15.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'DabaIsme2020';   
  temp.am = C2K(15.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'BoufZero2018 found 2190 d at 19C';

data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'DabaIsme2020';
data.Li  = 36.6;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'DabaIsme2020';

data.Wwb = 2.68e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 61.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'DabaIsme2020','fishbase'};
  comment.Wwp = 'based on 0.01148*(Lp)^3.03, see F1';
data.Wwi = 627;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'DabaIsme2020','fishbase'};
  comment.Wwi = 'based on 0.01148*(Li)^3.03, see F1';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 12
    2 15.9
    3 20
    4 22
    5 24
    6 25
    7 27
    8 29.2];  
data.tL(:,1) = (0.8+data.tL(:,1))*365; % convert to yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DabaIsme2020';
  
% length-fecundity
data.LN = [ ... total length (cm, fecundity (#)
17.749	56043.087
18.061	43546.416
18.409	54737.387
18.538	98366.783
19.027	75879.347
19.035	23509.545
19.044	90840.418
19.209	30975.381
19.536	48402.582
19.554	58376.052
19.645	102008.907
19.749	179306.333
20.598	89455.166
21.250	17077.893
21.316	93131.878
21.436	68183.501
21.652	53201.677
22.022	171622.593
22.341	121718.921
22.529	156614.828
24.126	252482.591
27.888	406760.962
29.160	471485.624];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(15.7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'DabaIsme2020';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01148*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74DMX'; % Cat of Life
metaData.links.id_ITIS = '169210'; % ITIS
metaData.links.id_EoL = '46579961'; % Ency of Life
metaData.links.id_Wiki = 'Oblada_melanura'; % Wikipedia
metaData.links.id_ADW = 'Oblada_melanura'; % ADW
metaData.links.id_Taxo = '181593'; % Taxonomicon
metaData.links.id_WoRMS = '1577363'; % WoRMS
metaData.links.id_fishbase = 'Oblada-melanura'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oblada_melanura}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Oblada-melanura.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DabaIsme2020'; type = 'article'; bib = [ ...  
'doi = {10.1515/ohs-2020-0002}, ' ...
'author = {Ismail Burak Daban and Ali Ismen and Mukadder Arslan Ihsanoglu and Koray Cabbar}, ' ...
'year = {2020}, ' ...
'title  = {Age, growth and reproductive biology of the saddled seabream (\emph{Oblada melanura}) in the {N}orth {A}egean {S}ea, {E}astern {M}editerranean}, ' ...
'journal = {Oceanological and Hydrobiological Studies}, ' ...
'volume = {49(1)}, ' ...
'pabes = {13-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
