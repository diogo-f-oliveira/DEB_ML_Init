function [data, auxData, metaData, txtData, weights] = mydata_Mullus_barbatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Mullus_barbatus'; 
metaData.species_en = 'Red mullet'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MAE','MAm','MAbl'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 25];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 38.2;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'CarbInti2015';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 16.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.0087*Lp^3.09, see F1';
data.Wwi = 673;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0087*Li^3.09, see F1';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % yr class (yr), total length (cm)
    1 10.7 10.3
    2 13.2 12.5
    3 15.5 14.1
    4 17.7 15.4
    5 20.1 NaN
    6 20.7 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.5) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(14.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Kuts2022'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % yr class (yr), weight (g)
    1 14.3 10.1
    2 18.7 14.7
    3 28.0 24.2
    4 43.3 37.6
    5 67.7 NaN
    6 72.5 NaN];
data.tW_fm(:,1) = (data.tW_fm(:,1) + 0.5) * 365; % convert yr to d
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm    = C2K(14.2);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Kuts2022'; treat.tW_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
11.486	145188.045
12.455	111279.061
13.063	183631.603
14.009	791106.853
14.054	185397.277
14.054	541743.989
14.459	1076988.498
14.505	506912.038
14.527	221874.515
14.977	1469892.707
15.023	828548.601
15.045	1256204.500
15.946	1614157.784
15.991	759003.673
16.396	902265.527
16.554	1294529.085
16.959	1295251.407
17.005	903349.009
17.027	1794258.037
17.410	2008748.823
17.455	1403037.833
17.500	975500.907
18.018	2009832.305
18.018	1689118.710
18.086	1404161.445
18.446	4825739.572
18.491	6607556.214
18.514	977306.710
18.514	2402696.383
19.122	1334738.319
19.482	5469009.868
20.495	3297096.633
20.586	5577881.190
20.923	8429262.471
20.991	7609784.431
21.441	9000340.742
21.532	6541704.565
22.027	9072653.861
22.500	15167037.915];
units.LN   = {'cm', 'cm'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(24);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CarbInti2015'; 
comment.LN = 'fecundity for May spawners; temperature is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'a fecundity of 9e6 eggs seems a lot for a 22 cm fish';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.0087*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RR9Q'; % Cat of Life
metaData.links.id_ITIS = '169419'; % ITIS
metaData.links.id_EoL = '1156454'; % Ency of Life
metaData.links.id_Wiki = 'Mullus_barbatus'; % Wikipedia
metaData.links.id_ADW = 'Mullus_barbatus'; % ADW
metaData.links.id_Taxo = '45355'; % Taxonomicon
metaData.links.id_WoRMS = '126985'; % WoRMS
metaData.links.id_fishbase = 'Mullus-barbatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mullus_barbatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; b45355ib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kuts2022'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945222010064}, ' ...
'author = {D. N. Kutsyn}, ' ... 
'year = {2022}, ' ...
'title = {Age, Growth, Maturation, and Mortality of Red Mullet \emph{Mullus barbatus} ({M}ullidae) of {C}rimea, the {B}lack {S}ea}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {62(2)}, ' ...
'pages = {244–253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CarbInti2015'; type = 'Article'; bib = [ ... 
'doi = {10.1051/alr/2015005}, ' ...
'author = {Pierluigi Carbonara and Simona Intini and Eisabetta Modugno and Francesca Maradonna and Maria Teresa Spedicato and Giuseppe Lembo and Walter Zupa and Oliana Carnevali}, ' ... 
'year = {2015}, ' ...
'title = {Reproductive biology characteristics of red mullet (\emph{Mullus barbatus} {L}., 1758) in {S}outhern {A}driatic {S}ea and management implications}, ' ...
'journal = {Aquat. Living Resour.}, ' ...
'volume = {28}, ' ...
'pages = {21–31}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mullus-barbatuss.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
