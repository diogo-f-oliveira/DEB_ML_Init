  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_chermocki
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_chermocki'; 
metaData.species_en = 'Vermilion darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L';'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 03]; 

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'KhudArri2005';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.1;  units.Lp = 'cm'; label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on same relative length, compared to E. cragini: 5.78*2.8/5.2';
data.Li = 5.78;    units.Li = 'cm'; label.Li = 'ultimate standard length';  bibkey.Li = 'KhudArri2005';

data.Wwb = 7.75e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KhudArri2005';
  comment.Wwb = 'based on egg diameter of 1.14 mm: pi/6*0.114^3';

data.Ri = 152/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'KhudArri2005';   
  temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), standard length (cm)
    1 3.30
    2 4.40
    3 4.50
    4 5.30];
data.tL(:,1) = 365 * (0 + data.tL(:,1));  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KhudArri2005';

data.LWw = [ ... % log10 standard length (mm), wet weight (g)
1.334	-0.978
1.343	-1.083
1.350	-0.933
1.357	-0.794
1.362	-0.878
1.381	-0.789
1.383	-0.727
1.392	-0.750
1.405	-0.739
1.406	-0.767
1.413	-0.622
1.425	-0.661
1.428	-0.784
1.435	-0.678
1.435	-0.594
1.437	-0.594
1.442	-0.477
1.443	-0.589
1.447	-0.567
1.448	-0.633
1.449	-0.516
1.451	-0.466
1.452	-0.639
1.454	-0.583
1.454	-0.522
1.461	-0.511
1.463	-0.511
1.465	-0.572
1.467	-0.472
1.472	-0.511
1.474	-0.428
1.477	-0.506
1.478	-0.439
1.481	-0.355
1.483	-0.495
1.483	-0.383
1.485	-0.389
1.489	-0.433
1.494	-0.294
1.495	-0.333
1.498	-0.400
1.501	-0.361
1.503	-0.406
1.506	-0.294
1.506	-0.261
1.509	-0.333
1.510	-0.272
1.517	-0.222
1.519	-0.305
1.521	-0.372
1.521	-0.333
1.523	-0.244
1.526	-0.194
1.531	-0.272
1.533	-0.317
1.535	-0.144
1.538	-0.345
1.540	-0.217
1.546	-0.155
1.546	-0.072
1.549	-0.172
1.550	-0.256
1.550	-0.250
1.554	-0.072
1.558	-0.256
1.558	-0.144
1.562	-0.111
1.564	-0.217
1.564	-0.189
1.571	-0.106
1.572	-0.067
1.576	-0.133
1.578	-0.094
1.581	-0.122
1.583	-0.106
1.586	-0.106
1.593	-0.072
1.595	0.017
1.596	-0.184
1.596	-0.028
1.606	-0.100
1.608	0.067
1.612	0.039
1.614	0.011
1.616	-0.095
1.622	0.000
1.623	0.133
1.627	0.028
1.629	0.106
1.630	-0.050
1.631	-0.011
1.636	0.050
1.641	-0.017
1.642	0.022
1.644	0.133
1.646	0.155
1.647	0.077
1.648	0.206
1.654	0.144
1.657	0.044
1.660	0.328
1.663	0.116
1.665	0.161
1.668	0.250
1.673	0.294
1.673	0.111
1.674	0.239
1.681	0.239
1.681	0.328
1.682	0.177
1.684	0.177
1.684	0.278
1.687	0.328
1.690	0.266
1.697	0.339
1.698	0.277
1.698	0.300
1.704	0.333
1.705	0.227
1.707	0.266
1.707	0.389
1.712	0.417
1.713	0.344
1.713	0.433
1.714	0.311
1.717	0.249
1.719	0.344
1.720	0.272
1.728	0.394
1.729	0.472
1.733	0.439
1.734	0.383
1.735	0.494
1.739	0.366
1.745	0.411
1.745	0.455
1.759	0.477
1.762	0.488];
data.LWw = 10.^data.LWw;  % undo log transform
data.LWw(:,1) =data.LWw(:,1)/10; % conver mm to cm
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'KhudArri2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males were smaller than females, but data concern combined sexes';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3BL2T'; % Cat of Life
metaData.links.id_ITIS = '201984'; % ITIS
metaData.links.id_EoL = '219409'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_chermocki'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_chermocki'; % ADW
metaData.links.id_Taxo = '690859'; % Taxonomicon
metaData.links.id_WoRMS = '1011076'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-chermocki'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_chermocki}}';  
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
bibkey = 'KhudArri2005'; type = 'article'; bib = [ ... 
'doi = {10.1080/02705060.2005.9664762}, ' ...
'author = {Jenjit Khudamrongsawat and D. Albrey Arrington and Bernard R. Kuhajda and Andrew L. Rype}, ' ...
'year = {2005}, ' ...
'title = {Life History of the Endangered Vermilion Darter (\emph{Etheostoma chermocki}) Endemic to the {B}lack {W}arrior {R}iver {S}ystem, {A}labama}, ' ... 
'journal = {Journal of Freshwater Ecology}, ' ...
'volume = {20}, '...
'pages = {469-477}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-chermocki.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
