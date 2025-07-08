function [data, auxData, metaData, txtData, weights] = mydata_Notropis_buccatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_buccatus'; 
metaData.species_en = 'Bluntnose minnow'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 03]; 

%% set data
% zero-variate data

data.am = 3.5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'Hoyt1971';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'Hoyt1971a'; 
  comment.Lp = 'based on tp 1 yr and tL data';
data.Li = 8.5;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 2.3e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Hoyt1971a';
  comment.Wwb = 'based on egg diameter of 0.76 mm: pi/6*0.076^3';

data.Ri = 1454/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'Hoyt1971a';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (yr), total length (cm)
    1 4.7
    2 6.5
    3 7.6];
data.tL(:,1) = 365 * (0.4 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hoyt1971';

% time-weight
data.tWw = [ ... % time (yr), wet weight (g)
1 0.320
2 2.022
3 3.619];
data.tWw(:,1) = 365 * (0.4 + data.tWw(:,1)); % convert yr to d
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'twet weight'};  
temp.tWw = C2K(15);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Hoyt1971';


% length - weight
LWw_f = [ ... % % total length (cm), wet weight (g)
2.696	0.126
3.086	0.198
3.418	0.260
3.584	0.308
3.799	0.405
4.015	0.460
4.180	0.522
4.362	0.594
4.594	0.732
4.793	0.787
4.983	0.922
5.173	1.049
5.388	1.142
5.594	1.301
5.776	1.436
5.974	1.608
6.172	1.719
6.361	1.905
6.776	2.043
6.946	2.471
7.151	2.730
7.333	2.889
7.533	3.711
7.642	3.632];
%
LWw_m = [ ... % % total length (cm), wet weight (g)
2.688	0.133
3.078	0.202
3.393	0.257
3.592	0.315
3.791	0.394
4.006	0.460
4.189	0.525
4.594	0.711
4.784	0.801
4.999	0.911
5.190	1.011
5.388	1.149
5.578	1.294
5.784	1.449
5.982	1.615
6.155	1.722
6.353	1.905
6.567	2.102
6.774	2.205
6.937	2.523
7.142	2.900
7.338	3.224
7.545	3.324];
data.LWw = [LWw_f; LWw_m];
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'Hoyt1971'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.84 * TL';
metaData.bibkey.F2 = 'fishesoftexas';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6SD5Z'; % Cat of Life
metaData.links.id_ITIS = '163478'; % ITIS
metaData.links.id_EoL = '51894178'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_buccatus'; % Wikipedia
metaData.links.id_ADW = 'Notropis_buccatus'; % ADW
metaData.links.id_Taxo = '181488'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Notropis-buccatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ericymba_buccata}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-buccatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/notropis buccula.htm}}';  
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
bibkey = 'Hoyt1971'; type = 'Article'; bib = [ ... 
'author = {Robert D. Hoyt}, ' ... 
'year = {1971}, ' ...
'title = {Age and Growth of the Silverjaw Minnow, \emph{Ericymba buccata} {C}ope, in {K}entucky}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {86(2)}, ' ...
'pages = {257-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hoyt1971a'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1971)100<510:TRBOTS>2.0.CO;2}, ' ...
'author = {Robert D. Hoyt}, ' ... 
'year = {1971}, ' ...
'title = {The Reproductive Biology of the Silverjaw Minnow, \emph{Ericymba buccata} {C}ope, in {K}entucky}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {100(3)}, ' ...
'pages = {510-519}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
    
    

