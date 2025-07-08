function [data, auxData, metaData, txtData, weights] = mydata_Torpedo_marmorata 

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Torpediniformes'; 
metaData.family     = 'Torpedinidae';
metaData.species    = 'Torpedo_marmorata'; 
metaData.species_en = 'Marbled electric ray'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15);  % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};
metaData.data_1     = {'L-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika', 'Bas Kooijman'};         
metaData.date_subm = [2013 04 11];                           
metaData.email    = {'lika@biology.uoc.gr'};                
metaData.address  = {'University of Crete, 71003, Greece'}; 

metaData.author_mod_1  = {'Dina Lika'};                          
metaData.date_mod_1    = [2015 03 24];                           
metaData.email_mod_1   = {'lika@biology.uoc.gr'};                
metaData.address_mod_1 = {'University of Crete, 71003, Greece'}; 

metaData.author_mod_2  = {'Bas Kooijman'};                          
metaData.date_mod_2    = [2015 08 03];                           
metaData.email_mod_2   = {'bas.kooijman@vu.nl'};                
metaData.address_mod_2 = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 18]; 

%% set data
% zero-variate data;
data.ab = 305;       units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'Wiki';    
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guessed for all data';
data.ap = 4562;      units.ap = 'd';    label.ap = 'age at puberty';                  bibkey.ap = 'AnAge';
  temp.ap = C2K(15); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 20 * 365;  units.am = 'd';    label.am = 'life span';                       bibkey.am = 'AnAge';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 12;        units.Lb = 'cm';   label.Lb = 'total length at birth';           bibkey.Lb = 'ConsScac2007';
data.Lp = 31.2;      units.Lp = 'cm';   label.Lp = 'total length at puberty';   bibkey.Lp = 'flmnh'; 
  comment.Lp = '25.1 cm for males';
data.Li = 180;        units.Li = 'cm';   label.Li = 'total length';             bibkey.Li = 'Wiki';  

data.Wwb = 11;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'MichSter1979'; 
  comment.Wwb = 'for T ocellata';
data.Wwi = 90e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'flmnh';

data.Ri = 17/365/2;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';             bibkey.Ri = 'Wiki';  
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-32 pups per 2 yr, assumed to be for a typical max length of 1 m'; 
 
% uni-variate data

%  length-weight
data.LW = [ ... % total length (cm), wet weight (g)
12.102	75.599
12.611	75.406
13.018	84.712
13.324	56.218
13.935	84.365
14.648	93.554
15.259	93.323
16.175	102.436
16.379	130.737
17.092	139.927
17.601	120.815
18.008	167.959
18.110	130.082
18.823	129.813
18.823	158.191
19.230	167.496
20.248	176.570
20.350	233.289
21.165	176.224
21.165	232.980
21.369	242.363
21.572	270.664
22.285	242.016
22.591	298.657
22.896	279.623
23.507	213.175
23.711	317.152
24.220	260.203
24.525	383.060
24.627	288.427
25.136	344.991
26.053	335.185
26.155	391.903
26.868	372.715
26.868	448.390
27.479	429.240
28.191	410.051
28.802	419.280
28.802	494.955
29.312	674.492
29.719	400.014
29.821	598.624
30.126	466.076
30.635	588.856
31.552	522.293
31.857	739.745
31.959	635.653
33.589	776.928
34.098	701.060
34.301	833.415
34.709	700.829
36.236	984.034
37.764	1229.402
38.069	1134.692
38.171	945.465
39.902	1304.269
40.004	973.149
40.004	1219.095
40.819	1398.517
40.921	1322.803
42.652	1312.688
42.957	1407.167
43.365	1851.608
43.670	1312.303
46.623	1717.942
47.234	1755.549
55.177	2594.435];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'ConsScac2007';

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 100 * weights.Ri;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weight.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Eats bony fish';
metaData.bibkey.F1 = 'Wiki';
F2 = 'Ovoviviparous, feeds young with uterine milk';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Can produce 70-80 volt';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3); 
  

%% Links
metaData.links.id_CoL = '57GD4'; % Cat of Life
metaData.links.id_ITIS = '160838'; % ITIS
metaData.links.id_EoL = '46560392'; % Ency of Life
metaData.links.id_Wiki = 'Torpedo_marmorata'; % Wikipedia
metaData.links.id_ADW = 'Torpedo_marmorata'; % ADW
metaData.links.id_Taxo = '170127'; % Taxonomicon
metaData.links.id_WoRMS = '271684'; % WoRMS
metaData.links.id_fishbase = 'Torpedo-marmorata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ... 
'howpublished = {\url{http://en.wikipedia.org/wiki/Torpedo_marmorata}}'; 
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
bibkey = 'MichSter1979'; type = 'Article'; bib = [... 
'author = {Michaelson, D. M. and Sternberg, D. and Flshelson, L. }, ' ...
'year = {1979}, ' ...
'title = {Observations on feeding, growth and electric discharge of newborn \emph{Torpedo ocellata}  ({C}hondrichthyes, {B}atoidei)}, ' ...
'journal = {J Fish Biol}, ' ...
'page = {159-163}, ' ...
'volume = {15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ConsScac2007'; type = 'Article'; bib = [... 
'author = {Consalvo, I. and Scacco, U. and Romanelli, M. and Vacchi, M.}, ' ...
'year = {2007}, ' ...
'title = {Comparative study on the reproductive biology of \emph{Torpedo torpedo} ({L}innaeus, 1758) and \emph{T. marmorata} ({R}isso, 1810) in the central {M}editerranean {S}ea}, ' ...
'journal = {SCIENTIA MARINA, Barcelona (Spain)}, ' ...
'page = {213-222}, ' ...
'volume = {71}, ' ...
'howpublished = {\url{http://www.icm.csic.es/scimar/index.php/secId/6/IdArt/3509/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ... 
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Torpedo_marmorata}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flmnh'; type = 'Misc'; bib = ... 
'howpublished = {\url{http://www.flmnh.ufl.edu/fish/gallery/descript/atlantictorpedo/atlantictorpedo.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  