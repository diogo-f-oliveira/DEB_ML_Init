  function [data, auxData, metaData, txtData, weights] = mydata_Cyprinella_trichroistia
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Cyprinella_trichroistia'; 
metaData.species_en = 'Tricolor shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biHa','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 08]; 

%% set data
% zero-variate data
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'ScotMayd2008';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.17;     units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'ScotMayd2008';
  comment.Lp = 'based on SL 4.5 cm';
data.Li = 10;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 8.8e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ScotMayd2008';
  comment.Wwb = 'based on egg diameter of 1.19 mm: pi/6*0.119^3';
data.Wwp = 1.11;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','ScotMayd2008'};
  comment.Wwp = 'based on 0.00708*Lp^3.08, see F1';
data.Wwi = 8.51;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.08, see F1';

data.Ri  = 148/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate at SL 7.2 cm';    bibkey.Ri  = 'ScotMayd2008';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since hatch (d), std length (cm)
182.605	1.273
213.858	1.361
245.137	1.517
278.763	1.537
303.981	1.546
337.643	1.654
367.671	1.683
396.557	1.859
429.006	1.937
457.845	1.995
485.546	2.210
519.250	2.424
551.590	2.229
579.307	2.483
609.511	2.951
641.967	3.049
672.019	3.137
703.228	3.117
800-86.875	2.941
800-59.229	3.020
800-29.173	3.117
800+4.504	3.263
800+32.139	3.312
800+60.919	3.224
800+93.481	3.585
800+123.502	3.595
800+154.848	3.917
800+186.108	4.024
800+216.175	4.151
800+243.794	4.161
800+278.664	4.288
800+307.534	4.424
800+338.630	4.122
800+368.912	4.785
800+395.366	4.883
800+429.035	5.010
800+460.264	5.039
800+487.945	5.205
800+518.013	5.332];
data.tL(:,2) = data.tL(:,2)/0.87; % convert SL to TL
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
  temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = {'ScotMayd2008'};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;
%weights.psd.p_M = weights.psd.p_M * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight fro Exoglossum: Ww in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.87*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '33HJH'; % Cat of Life
metaData.links.id_ITIS = '163806'; % ITIS
metaData.links.id_EoL = '211744'; % Ency of Life
metaData.links.id_Wiki = 'Cyprinella_trichroistia'; % Wikipedia
metaData.links.id_ADW = 'Cyprinella_trichroistia'; % ADW
metaData.links.id_Taxo = '172714'; % Taxonomicon
metaData.links.id_WoRMS = '1020135'; % WoRMS
metaData.links.id_fishbase = 'Cyprinella-trichroistia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Cyprinella_trichroistia}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cyprinella-trichroistia.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ScotMayd2008'; type = 'Article'; bib = [ ... 
'doi = {10.1656/1528-7092(2008)7[69:LHOTTS]2.0.CO;2}, ' ...
'author = {Jeremy H. Scott and Richard L. Mayden}, ' ... 
'year = {2008}, ' ...
'title = {Life History of the Tricolor Shiner, \emph{Cyprinella trichroistia} ({T}eleostei: {C}yprinidae), in {A}labama}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {7(1)}, ' ...
'pages = {69-80}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  