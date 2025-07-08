  function [data, auxData, metaData, txtData, weights] = mydata_Myloplus_rhomboidalis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Serrasalmidae';
metaData.species    = 'Myloplus_rhomboidalis'; 
metaData.species_en = 'Coumarou'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHs','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 03];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 03];

%% set data
% zero-variate data
data.ab = 14; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'LecoBouj1993';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;  units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 40.5;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 1.15e-2;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BailMarg1989';
  comment.Wwb = 'based on egg diameter of 2.8 mm fpr Myleus ternetzi: pi/6*0.28^3';
data.Wwp = 287;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02089*Lip^2.96, see F1';
data.Wwi = 5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight, based on 0.02089*Li^2.96, see F1, gives 1.2e3';

data.Ri = 1.12e5/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'BailMarg1989';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on 0.239*Li^3.232 and 3 spawnings per yr for Myleus ternetzi';
  
% uni-variate data
% time-length
data.tL_SA = [ ... % time since birth (yr), std length (cm)
0.5	 8.154  9.921
1.	12.771 12.771
1.5	16.186 15.301
2.	20.164 18.234
2.5	23.257 19.721
3.0	29.319 22.490
3.5	29.359 22.048
4.	34.056 27.712
4.5	36.748 NaN
5.	37.107 NaN];
data.tL_SA(:,1) = (data.tL_SA(:,1) + 0.4) * 365; % convert yr to d
data.tL_SA(:,2:3) = data.tL_SA(:,2:3)/0.857; % convert SL to TL
units.tL_SA = {'d', 'cm'};  label.tL_SA = {'time since birth', 'total length'};  
  temp.tL_SA = C2K(25);  units.temp.tL_SA = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_SA = {1, {'Sinnamary','Approuague',}};
bibkey.tL_SA = 'LecoBouj1993';
comment.tL_SA = 'Data from Sinnamary and Approuague River, French Guyana';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_SA = weights.tL_SA * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.96'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.857*TL from photo'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4547P'; % Cat of Life
metaData.links.id_ITIS = '641444'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Myloplus_rhomboidalis'; % Wikipedia
metaData.links.id_ADW = 'Myloplus_rhomboidalis'; % ADW
metaData.links.id_Taxo = '180545'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Myloplus-rhomboidalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Myloplus_rhomboidalis}}';  
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
bibkey = 'LecoBouj1993'; type = 'Article'; bib = [ ...
'doi = {10.3406/revec.1993.2119}, ' ...
'author = {Lecomte, Fr\''{e}d\''{e}rique and Boujard, Thierry and Meunier, Fran\c{c}ois Jean and Renno, Jean-Fran\c{c}ois and Rojas-Beltran, Ricardo}, ' ...
'year = {1993}, ' ...
'title = {The growth of \emph{Myleus rhomboidalis} ({C}uvier, 1817) ({C}haraciforme, {S}errasalmidae) in two rivers of {F}rench {G}uiana}, ' ... 
'journal = {Revue d''\''{E}cologie (La Terre et La Vie)}, ' ...
'volume = {48(4)}, '...
'pages = {421-435}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BailMarg1989'; type = 'Article'; bib = [ ...
'doi = {10.1051/alr:1989021}, ' ...
'author = {Pierre-Yves Le Bail and Anne Margeridon and Chantal Cauty}, ' ...
'year = {1989}, ' ...
'title = {Biologie de la reproduction de \emph{Myleus ternetzi}}, ' ... 
'journal = {Aquatic Living Resources}, ' ...
'volume = {2(3)}, '...
'pages = {175 - 183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Myloplus-rhomboidalis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

