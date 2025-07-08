  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_kansae
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_kansae'; 
metaData.species_en = 'Northern plains killifish'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 02]; 

%% set data
% zero-variate data
data.am = 2.2*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'MincKlaa1969';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp =  4.0;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'MincKlaa1969'; 
data.Li = 10;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 4.6e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'MincKlaa1969';   
  comment.Wwb = 'based on egg diameter of 2.06 mm : pi/6*0.206^3';
data.Wwi = 7.3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00603*Li^3.08';
   
% uni-variate data
% time - length
data.tL = [ ... % time (d), total length (cm)
 65 2.45
 95 3.5
440 5.3
730 7.6];
data.tL(:,1) = data.tL(:,1) + 20; % set origin on birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MincKlaa1969';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
4.126	59.532
4.150	21.055
4.241	33.142
4.262	22.629
4.357	41.204
4.501	18.620
4.699	28.478
4.709	23.781
4.720	16.847
4.726	62.261
4.820	39.897
4.823	55.780
4.848	62.717
5.039	35.662
5.130	42.157
5.141	31.867
5.166	37.238
5.176	34.107
5.261	46.641
5.277	90.043
5.293	35.010
5.390	26.740
5.394	43.071
5.481	39.275
5.501	43.974
5.612	52.931
5.704	39.963
5.746	34.820
5.804	10.216
5.846	50.711
5.951	64.589
6.032	15.378
6.064	57.663
6.088	67.955
6.153	31.047
6.270	78.260
6.272	61.258
6.311	71.999
6.381	39.566
7.173	51.258];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(23);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'MincKlaa1969';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'mean temperatures are guessed';
D2 = 'tL data reconstructed from length-frequency counts';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6JRFZ'; % Cat of Life
metaData.links.id_ITIS = '165654'; % ITIS
metaData.links.id_EoL = '1156439'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_kansae'; % ADW
metaData.links.id_Taxo = '387308'; % Taxonomicon
metaData.links.id_WoRMS = '1019307'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-kansae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus}}';
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
bibkey = 'MincKlaa1969'; type = 'Article'; bib = [ ...
'doi = {10.1577/1548-8659(1969)98[460:LHOTPK]2.0.CO;2}, ' ...
'author = {C. O. Minckley and Harold E. Klaassen}, ' ...
'year = {1969}, ' ...
'title = {Life History of the Plains Killifish, \emph{Fundulus kansae} ({G}arman), in the {S}moky {H}ill {R}iver, {K}ansas}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' , ...
'volume = {98(3)}, ' ...
'pages = {460-465}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-kansae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


